# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#= require_self
#= require_tree ./controllers
#= require_tree ./services

Champs = angular.module('Champs',['ngResource','ngRoute', 'underscore'])
Champs.config(
	[
		'$routeProvider'
		($routeProvider) ->
			$routeProvider.when('/home',
				{
					templateUrl: '../assets/home.html' 
					controller: 'HomeController'
					resolve: [
						'AuthenticationService' 
						(AuthenticationService) ->
							AuthenticationService.current_user().then(
								(response) -> 
									response.data?
								(response) ->
									false
								)
					]

				})
			$routeProvider.otherwise({templateUrl: '../assets/login.html', controller: 'LoginController'})
	])

# adding underscore
underscore = angular.module('underscore', [])
underscore.factory('_', -> window._)