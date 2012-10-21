'use strict';

imqsCsApp
  .factory("JournalLine", ["$resource", function($resource) {
    return $resource('/invent_journal_lines/:id/:action');
  }])
  .controller('JournalLinesCtrl', ["$scope", "JournalLine", function($scope, JournalLine) {

    $scope.j.lines = [];
    
    $scope.new = function() {
      $scope.j.lines = [{ journal_id: $scope.j.id, mode: "edit" }].concat($scope.j.lines);
    };        
  }])
  
  .controller('JournalLineFormCtrl', ["$scope", "JournalLine", function($scope, JournalLine) {
    $scope.createOrUpdate = function() {
      var s = $scope;
      s.l.mode = "loading";
      s.l.errors = null;
      if(s.l.id == undefined)
        JournalLine.create(null, s.l, function(r) {
          $.extend(s.l, r);
          s.l.mode = "show";
        }, function(r) {
          s.l.mode = "edit";
          s.l.errors = r.data;
        });
      else
        JournalLine.update({ id: s.l.id }, s.l, function(r) {
          s.l.mode = "show";
        }, function(r) {
          s.l.mode = "edit";
          s.l.errors = r.data;
        })
    };
    
    $scope.cancel = function() {
      var l = $scope.l;
      if(l.id == undefined) {
        var lTmp = $.grep($scope.j.lines, function(v) {return v != l});
        $scope.j.lines.splice(0, $scope.j.lines.length);
        $.merge($scope.j.lines, lTmp);
      }
      else
        l.mode = "show";
    };
    
    $scope.destroy = function() {
      var l = $scope.l;
      l.mode = "loading";
      JournalLine.destroy({id: l.id}, null, function() {
        $scope.j.lines = $.grep($scope.j.lines, function(v) { return v != l });
      });
    };
  
  }]);