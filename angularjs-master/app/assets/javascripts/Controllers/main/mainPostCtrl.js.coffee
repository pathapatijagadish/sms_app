@PostCtrl = ($scope, $location, $routeParams, postData) ->

  $scope.data =
    postData: postData.data

  postData.loadPosts()


  $scope.viewPost = (postId) ->
    $location.url('/post/'+postId)

  $scope.viewPosts=() ->
  	$location.url('/')

  $scope.data.postId = $routeParams.postId


