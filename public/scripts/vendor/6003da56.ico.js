angular.module("ico",[])
  .directive('icoForm', function($parse) {
  	return {
  		compile: function(tElement, tAttrs, transclude) {

        return function(scope, iElement, iAttrs, controller) {
          
          if(scope.$eval(iAttrs.icoForm)=="edit") {          
            $('[show-form]', iElement).hide();                  
          }
          else {
            $('[edit-form]', iElement).hide();
          };
          
          scope.$watch(iAttrs.icoForm, function(newValue) {
            if(newValue == 'show') {
              $('[edit-form]', iElement).hide();
              $('[show-form]', iElement).show();
            }
            else if(newValue == 'edit') {
              $('[show-form]', iElement).hide(); 
              $('[edit-form]', iElement).show();
            };        

          });
        }
  		}
  	}
  })
  .directive('icoError', function() {
    return {
      template: "" +
        "<ul>" +
          "<li>{{e}}</li>" +
        "</ul>",
      replace: false,
      transclude: false,
      compile: function(tElement, tAttrs, transclude) {
        $("li", tElement).attr('ng-repeat', "e in " + tAttrs.icoError);
      }
    }
  })
  .directive('icoInput', function() {
    return {
      template: "" +
      "<div>" +
        "<label ng-transclude></label>" +
        "<br />" +
        "<input>" +
        "<br />" +
        "<div ico-error></div>" +
      "</div>",
      replace: false,
      transclude: true,
      compile: function(tElement, tAttrs, transclude) {
        $('input', tElement)
          .attr('ng-model', tAttrs.icoInput)
          .attr('id', tAttrs.icoInput);
        
        $('label', tElement)
          .attr('for', tAttrs.icoInput);
        
        var m = tAttrs.icoInput.split('.');
        m.splice(-1, 0, 'errors');

        $('div[ico-error]', tElement)
          .attr('ico-error', m.join('.'));

        $(tElement)
          .attr('ng-model', null)
          .attr('label', null);
      }
    }
  })
  .directive('icoLoading', function() {
    return {

      compile: function(tElement, tAttrs, transclude) {
        
        var spinner = new Spinner();

        return function(scope, iElement, iAttrs, controller) {
          scope.$watch(iAttrs.icoLoading || iAttrs.icoForm, function(newValue) {
            
            var e = $(iElement); 
            if(newValue=='true' || newValue=='loading') {
              $(iElement).addClass("loading");
              $("input, select", iElement).attr("disabled", true);
              $('a', iElement).css({'pointer-events': 'none'});
              spinner.spin();
              var s = $(spinner.el);
              e.css({'min-height': '40px'});
              s.css({top: e.height()/2 + 'px', left: e.width()/2 + 'px'});
              e.prepend(s);
            }
            else {
              spinner.stop();
              $(iElement).removeClass("loading");
              $('a', iElement).css({'pointer-events': ''});
              $("input, select", iElement).attr("disabled", false);
              e.css({'min-height': ''});
            }
            
            $(window).resize(function() {
              if($(spinner.el).closest('html').length)
                $(spinner.el).css({top: e.height()/2 + 'px', left: e.width()/2 + 'px'});
            });

          })
        }
      }
    }
  });