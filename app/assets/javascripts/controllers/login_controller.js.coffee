angular.module('Champs').controller('LoginController'
	[
		'$location'
		'$scope'
		'AuthenticationService'
		'UserService'
		'_' 
		($location, $scope, AuthenticationService, UserService, _) -> 
			$scope.loginUser = ->
				console.log('User attempting to log in')
				# get valid list of UserS
				users = UserService.query(->
					user = _.findWhere(users, username: $scope.username)
					if user?
					 console.log("#{user.email} authorized") 
					 toastr.success('Login Partially successfull')
					 AuthenticationService.login(user.username, $scope.password).then(
					 	(response) ->
					 		toastr.success("Congratulations you are accepted")
					 		$location.url('/home')
					 	(response) ->
					 		toastr.error("Authentication Failed my Friend")
					 	)
					 #try the authentication
					else 
						console.error($scope.username + " not authorized")
						toastr.error('Login Failure','You are not authorized')
					)
	])