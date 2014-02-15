angular.module('Champs').factory('UserService',
	[
		'$resource'
		($resource) ->
			$resource('/users/:id', null,{'update' : {method: 'PUT'}})
	])