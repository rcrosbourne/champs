angular.module('Champs').controller('HomeController',
	[
		'$location'
		'$scope'
		'AuthenticationService' 
		($location, $scope, AuthenticationService) -> 
			$scope.title = 'Home Controller Baby'
			AuthenticationService.current_user().then(
				(response) ->
					$scope.current_user = response.data
				(response) ->
					$scope.current_user = ""
					toastr.error("I am sorry! You are not authorized to see this page. Please login")
					$location.url('/')
				)
			$scope.logout = ->
				#show popup for confirmation
				# ask verification
				$.SmartMessageBox(
					{
						title : "<i class='fa fa-sign-out txt-color-orangeDark'></i> Logout <span class='txt-color-orangeDark'><strong>" + $('#show-shortcut').text() + "</strong></span> ?",
						content : "You can improve your security further after logging out by closing this opened browser",
						buttons : '[No][Yes]'
					} 
					(ButtonPressed) -> 
						if (ButtonPressed is "Yes") 
							toastr.warning("You are about to logout")
							AuthenticationService.logout().then(
								->
									toastr.success("You have been logged out")
									$location.url('/')
								->
									toastr.error("There is a problem logging you out"))
						

				)

	])