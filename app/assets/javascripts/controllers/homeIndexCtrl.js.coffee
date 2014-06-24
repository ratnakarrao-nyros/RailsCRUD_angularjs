angular.module('sportsStore').controller "HomeIndexCtrl" , ($scope, $routeParams, $location,TaskList) ->
  #$scope.lists = [{title: "first "}, {title: "second"}]
  $scope.init = ->
    @listService = new TaskList(serverErrorHandler)
    $scope.lists = @listService.all()


  $scope.createList = (name) ->
    @listService.create title: name , (list) ->
      #$location.url("/task_lists/#{list.id}")
      $scope.lists.unshift(list) 
      $scope.listTitle = "" 
  
  $scope.deleteList = (list,index) ->
  	@listService.delete list , (returnval) ->
  		console.log(returnval) 
  	$scope.lists.splice(index)


  serverErrorHandler = ->
    "There was a server error, please reload the page and try again." 
