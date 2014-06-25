angular.module('sportsStore').controller "HomeIndexCtrl" , ($scope, $routeParams, $location,TaskList) ->
  #$scope.lists = [{title: "first "}, {title: "second"}]
  $scope.init = ->
    @listService = new TaskList(serverErrorHandler)
    $scope.lists = @listService.all()
    notifyCall("Welcome to Angular Rails Sample application","you are on the listings page now","info")


  $scope.createList = (name) ->
    @listService.create title: name , (list) ->
      #$location.url("/task_lists/#{list.id}")
      $scope.lists.unshift(list) 
      $scope.listTitle = "" 
      notifyCall(list.title, "List is created successfully", "success")
  
  $scope.deleteList = (list,index) ->
  	@listService.delete list , (returnval) ->
  		console.log(returnval) 
  	$scope.lists.splice(index,1)


  $scope.listEdited = (list) ->
    @listService.update(list, title: list.title)
    notifyCall(list.title, "List is updated as "+ list.title, "success")


  serverErrorHandler = ->
    "There was a server error, please reload the page and try again." 

  

  notifyCall = (title, text,type) ->
    new PNotify
      title: title
      text: text
      type: type
      styling: 'bootstrap3'


