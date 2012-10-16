angular.module("ico",[])
  .directive('icoForm', function($parse) {
  	return {
  		link: function(scope, iElement, iAttrs, controller) {
  			
  			if($parse(iAttrs['icoForm'])(scope)=="edit") {  				
  				$('[show-form]', iElement).hide();  				  			
  			}
  			else {
  				$('[edit-form]', iElement).hide();
  			};
  			
        scope.$watch(iAttrs['icoForm'], function(newValue) {
          if(newValue == 'show') {
            $('[edit-form]', iElement).hide();
            $('[show-form]', iElement).show();
          }
          else if(newValue == 'edit') {
            $('[show-form]', iElement).hide(); 
            $('[edit-form]', iElement).show();
          }
        });

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