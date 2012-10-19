angular.module("ico",[])
  .directive('icoForm', function($parse) {
  	return {
  		compile: function(tElement, tAttrs, transclude) {

        // new Spinner().spin(tElement);
        var spinner = new Spinner().spin();      
        var e = $(tElement);
        $(window).resize(function() {
          if(spinner.el && $(spinner.el).closest('html').length) {
            $(spinner.el).css({top: e.height()/2 + 'px', left: e.width()/2 + 'px'});
            // console.log(spinner.el);
          };
        });

        return function(scope, iElement, iAttrs, controller) {
          
          if($parse(iAttrs['icoForm'])(scope)=="edit") {          
            $('[show-form]', iElement).hide();                  
          }
          else {
            $('[edit-form]', iElement).hide();
          };
          
          scope.$watch(iAttrs['icoForm'], function(newValue) {
            if(newValue == 'show') {
              loadingOff();
              $('[edit-form]', iElement).hide();
              $('[show-form]', iElement).show();
            }
            else if(newValue == 'edit') {
              loadingOff();
              $('[show-form]', iElement).hide(); 
              $('[edit-form]', iElement).show();
            }
            else if(newValue == 'loading') {
              loadingOn();
            }            

            function loadingOn() {

              $(iElement).addClass("loading");
              $("input, select", iElement).attr("disabled", true);
              spinner.spin();
              var s = $(spinner.el);
              var e = $(iElement);
              $('a', iElement).css({'pointer-events': 'none'});
              s.css({top: e.height()/2 + 'px', left: e.width()/2 + 'px'});
              e.prepend(s);
            };

            function loadingOff() {
              $(iElement).removeClass("loading");
              $('a', iElement).css({'pointer-events': ''});
              $("input, select", iElement).attr("disabled", false);
              spinner.stop();
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
  });