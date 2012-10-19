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
      var s = this;
      s.l.errors = null;
      if(s.l.id == undefined)
        JournalLine.create(null, s.l, function(r) {
          $.extend(s.$parent.l, r);
          s.$parent.l.mode = "show";
        }, function(r) {
          s.l.errors = r.data;
        });
      else
        JournalLine.update({ id: s.l.id }, s.l, function(r) {
          s.$parent.l.mode = "show";
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
      JournalLine.destroy({id: l.id}, null, function() {
        $scope.j.lines = $.grep($scope.j.lines, function(v) { return v != l });
      })
    };
  
  }]);