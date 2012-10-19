'use strict';

// Declare app level module which depends on filters, and services
var imqsCsApp = angular.module('imqsCsApp', ['ngResource', 'ico'])
  .config(['$routeProvider', function($routeProvider) {
    $routeProvider
      .when('/', {
        templateUrl: 'views/main.html',
        controller: 'MainCtrl'
      })
      .when('/journals', {
        templateUrl: 'views/main.html',
        controller: 'JournalsPageCtrl'
      })
      .otherwise({
        redirectTo: '/'
      });
  }]);

  var imqsCsAppDev = angular.module('imqsCsAppDev', ['imqsCsApp', 'ngMockE2E']);
  imqsCsAppDev.run(["$httpBackend", function($httpBackend) {
      
      // JOURNALS
      var journals = [
        { id: 1, 
          number: '0001', 
          description: 'Cool journal', 
          journal_type: 1, 
          location_id: 1, 
          to_location_id: 2 
        }
      ];
  
      $httpBackend.whenGET('/invent_journals').respond(journals);
      
      $httpBackend.whenPOST('/invent_journals').respond(function(method, url, data) {
        
        var r = angular.fromJson(data)
        var e = {};
        if(r.number == null || r.number == '') {
          e['number'] = ["can't be null", 
            "the second error",
            "the third error"];
  
        }
        if(r.description == null || r.description == '') {
          e['description'] = ["can't be null"];
        }
        
        if(r.description != r.number) {
          e['main'] = ["description should be equal number"];
        }

        // var ms = 5000;
        // ms += new Date().getTime();
        // while (new Date() < ms){}

        if(!$.isEmptyObject(e))
          return [400, e];
        
        r.mode = "";
        r.class = "";
        journals.push(angular.fromJson(r));
        return [200];

      });
      
      $httpBackend.whenDELETE(/\/invent_journals\/[1-9]/).respond(function(method, url, data, headers) {
        var re = /([^\/]+)$/mg;
        console.log(re.exec(url));
        return [200];
      });
  
      $httpBackend.whenPUT(/\/invent_journals\/[1-9]/).respond(function(method, url, data, headers) {
        return [200];
      });
  
      // LINES
      var lines = [
        { id: 1,
          journal_id: 1,
          journal_number: '0001',
          item_id: 1,
          qty: 10
        }
      ]
  
      $httpBackend.whenGET('/invent_journal_lines?journal_id=1').respond(lines);
      
      $httpBackend.whenPOST(/\/invent_journal_lines/).respond(function(method, url, data,headers) {
        var d = angular.fromJson(data);
        d.id = 2;
        console.log(angular.toJson(d));
        return [200, angular.toJson(d)];
      });
  
      $httpBackend.whenPUT(/\/invent_journal_lines\/[1-9]/).respond(function(method, url, data, headers) {
        return [200];
      });
  
      $httpBackend.whenDELETE(/\/invent_journal_lines\/[1-9]/).respond(function(method, url, data, headers) {
        return [200];
      });
  
      // VIEWS
      $httpBackend.whenGET(/^views\//).passThrough();
  
    }]);

jQuery(function() {
  // var spinner = new Spinner().spin($('body'));
  // var spinner = new Spinner().spin();
  // $('body').append(spinner.el);
})