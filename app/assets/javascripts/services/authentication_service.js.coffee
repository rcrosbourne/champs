angular.module('Champs').factory('AuthenticationService',
[
  '$http'
  ($http) ->
    {
      login: (username,password) ->
              $http(
               {
                  method: "POST"
                  url: "/session/login"
                  params: {
                            "username" : "#{username}"
                            "password" : "#{password}"
                          }
                  headers: {
                             "Content-Type" : "application/json"
                           }
               })
        current_user: -> 
          $http(
            {
              method: "GET"
              url: "/session/current_user"
              headers:{"Content-Type" : "application/json"}
            })
        logout: ->
          $http(
            {
              method: "DELETE"
              url: "/session/logout"
              headers:{"Content-Type" : "application/json"}
            })
    }
])