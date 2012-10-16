"use strict";var imqsCsApp=angular.module("imqsCsApp",["ngResource","ico"]).config(["$routeProvider",function(a){a.when("/",{templateUrl:"views/main.html",controller:"MainCtrl"}).when("/journals",{templateUrl:"views/main.html",controller:"JournalsPageCtrl"}).otherwise({redirectTo:"/"})}]),imqsCsAppDev=angular.module("imqsCsAppDev",["imqsCsApp","ngMockE2E"]);imqsCsAppDev.run(["$httpBackend",function(a){var b=[{id:1,number:"0001",description:"Cool journal",journal_type:1,location_id:1,to_location_id:2}];a.whenGET("/invent_journals").respond(b),a.whenPOST("/invent_journals").respond(function(a,c,d){var e=angular.fromJson(d),f={};if(e.number==null||e.number=="")f.number=["can't be null","the second error","the third error"];if(e.description==null||e.description=="")f.description=["can't be null"];return e.description!=e.number&&(f.main=["description should be equal number"]),$.isEmptyObject(f)?(e.mode="",e.class="",b.push(angular.fromJson(e)),[200]):[400,f]}),a.whenDELETE(/\/invent_journals\/[1-9]/).respond(function(a,b,c,d){var e=/([^\/]+)$/mg;return console.log(e.exec(b)),[200]}),a.whenPUT(/\/invent_journals\/[1-9]/).respond(function(a,b,c,d){return[200]});var c=[{id:1,journal_id:1,journal_number:"0001",item_id:1,qty:10}];a.whenGET("/invent_journal_lines?journal_id=1").respond(c),a.whenPOST(/\/invent_journal_lines/).respond(function(a,b,c,d){var e=angular.fromJson(c);return e.id=2,console.log(angular.toJson(e)),[200,angular.toJson(e)]}),a.whenPUT(/\/invent_journal_lines\/[1-9]/).respond(function(a,b,c,d){return[200]}),a.whenDELETE(/\/invent_journal_lines\/[1-9]/).respond(function(a,b,c,d){return[200]}),a.whenGET(/^views\//).passThrough()}]),"use strict",imqsCsApp.controller("MainCtrl",["$scope",function(a){a.header="Greeting",a.dataUrl="views/welcome.html"}]),"use strict",imqsCsApp.factory("Journal",["$resource",function(a){return a("/invent_journals/:id/:action")}]).controller("JournalsPageCtrl",["$scope",function(a){a.header="Journals",a.dataUrl="views/journals.html"}]).controller("JournalsContentCtrl",["$scope","Journal",function(a,b){a.journals=b.query(),a.new=function(){var b=[{"class":"new-form",mode:"edit",show_lines:!1}];a.journals=b.concat(a.journals)}}]).controller("JournalCtrl",["$scope","Journal",function(a,b){a.createOrUpdate=function(){var c=a;c.j.id==undefined?b.create(null,c.j,function(a){$.extend(c.j,a),c.j.class=null,c.j.mode="show",c.j.lines=[{journal_id:c.j.id,mode:"edit"}],c.j.show_lines=!0},function(a){c.j.errors=a.data}):b.update({id:c.j.id},c.j,function(a){})},a.cancel=function(){var b=a.j;if(b.id==undefined){var c=$.grep(a.journals,function(a){return a!=b});a.journals.splice(0,a.journals.length),$.merge(a.journals,c)}else b.mode="show"},a.destroy=function(){var c=this.j;b.destroy({id:c.id},null,function(){var b=$.grep(a.journals,function(a){return a!=c});a.journals.splice(0,a.journals.length),$.merge(a.journals,b)},function(){alert("error")})}}]),"use strict",imqsCsApp.factory("JournalLine",["$resource",function(a){return a("/invent_journal_lines/:id/:action")}]).controller("JournalLinesCtrl",["$scope","JournalLine",function(a,b){a.j.id!=undefined?a.j.lines=b.query({journal_id:a.j.id}):a.j.lines==undefined&&(a.j.lines=[]),a.new=function(){a.j.lines=[{journal_id:a.j.id,mode:"edit"}].concat(a.j.lines)}}]).controller("JournalLineFormCtrl",["$scope","JournalLine",function(a,b){a.createOrUpdate=function(){var a=this;a.l.id==undefined?b.create(null,a.l,function(b){$.extend(a.$parent.l,b),a.$parent.l.mode="show"}):b.update({id:a.l.id},a.l,function(b){a.$parent.l.mode="show"})},a.cancel=function(){var b=a.l;if(b.id==undefined){var c=$.grep(a.j.lines,function(a){return a!=b});a.j.lines.splice(0,a.j.lines.length),$.merge(a.j.lines,c)}else b.mode="show"},a.destroy=function(){var c=a.l;b.destroy({id:c.id},null,function(){a.j.lines=$.grep(a.j.lines,function(a){return a!=c})})}}]);