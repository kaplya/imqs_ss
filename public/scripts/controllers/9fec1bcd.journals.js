'use strict';

imqsCsApp
  .factory("Journal", ["$resource", function($resource) {
      return $resource('/invent_journals/:id/:action');
    }])
  .controller('JournalsPageCtrl', ["$scope", function($scope) {
      $scope.header = "Journals"
      $scope.dataUrl = "views/journals.html";
    }])
  .controller('JournalsContentCtrl', ["$scope", "Journal", function($scope, Journal) {
      $scope.journals = Journal.query();
      $scope.new = function() {
        var j = [
          {
            class: "new-form",
            mode: "edit",
            show_lines: false
          }
        ];
        $scope.journals = j.concat($scope.journals);
      }
    }])
  .controller("JournalCtrl", ["$scope", "Journal", "JournalLine", function($scope, Journal, JournalLine) {
    
    $scope.$watch('j.show_lines', function(newVal) {
      if(newVal && $scope.j.id != undefined)
        $scope.j.lines = JournalLine.query({journal_id: $scope.j.id});
      else
        $scope.j.lines = [];
    });

    $scope.createOrUpdate = function() {
      var s = $scope;
      s.j.mode = "loading";
      if (s.j.id == undefined)
        Journal.create(null, s.j, function(r) {
          $.extend(s.j, r);
          s.j.class = null;
          s.j.mode = "show";
          s.j.lines = [{ journal_id: s.j.id, mode: "edit" }];
          s.j.show_lines = true;
          s.j.errors = null;
        }, function(r) {
          // console.log(r.data);
          s.j.mode = "edit";
          s.j.errors = r.data;
        });
      else
        Journal.update({id: s.j.id}, s.j, function(r) {
          s.j.mode = "show";
        })
    };
  
    $scope.cancel = function() {
      var j = $scope.j;
      if(j.id == undefined) {
        var jTmp = $.grep($scope.journals, function(v) {return v != j})
        $scope.journals.splice(0, $scope.journals.length);
        $.merge($scope.journals, jTmp);
      }
      else
        j.mode = "show";
    };

    $scope.destroy = function() {
      var j = this.j;
      Journal.destroy({id: j.id}, null, function() {
        var jTmp = $.grep($scope.journals, function(v) {return v != j})
        $scope.journals.splice(0, $scope.journals.length);
        $.merge($scope.journals, jTmp);
      }, function() {
        alert('error');
      })
    }
  
  }]);
