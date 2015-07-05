// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require turbolinks
//= require angular/angular
//= require_tree .

var AccountApp = angular.module("AccountApp", []);

// CSRF param to allow angular to post/patch to rails server
AccountApp.config(["$httpProvider", function ($httpProvider) {
    $httpProvider.
        defaults.headers.common["X-CSRF"] = $("meta[name=csrf-token]").attr("content");
}]);

AccountApp.factory('TokenService', ['$http', '$q', function($http, $q) {

  var token_endpoint = '/tokens/'
  var service = {};
  var deferred = $q.defer();

  service.reset_token = function(id) {
    $http
      .get(token_endpoint + 'reset/' + id)
      .success(function (response) {
        deferred.resolve(response);
      })
      .error(function (rejection) {
        deferred.reject(rejection);
      });

    return deferred.promise;
  }

  service.get_token = function(user_id) {
    $http
      .get(token_endpoint + user_id)
      .success(function (response) {
        deferred.resolve(response);
      })
      .error(function (rejection) {
        deferred.reject(rejection);
      });

    return deferred.promise;
  }

  return service;

}]);

AccountApp.factory('UserService', ['$http', '$q', function($http, $q) {

  var endpoint = '/store_its/';
  var path = window.location.pathname.split('/');
  var id = path[path.length-1];
  var service = {};
  var deferred = $q.defer();

  service.current_user = function() {
    $http
      .get(endpoint + id + ".json")
      .success(function (response) {
        deferred.resolve(response);
      })
      .error(function (rejection) {
        deferred.reject(rejection);
      });

    return deferred.promise;
  }

  return service;

}]);

AccountApp.controller("UserCtrl", ['UserService', 'TokenService', '$scope',
                                   function (UserService, TokenService) {
  var vm = this;
  vm.current_user = null;
  UserService.current_user().then(
    function(response) {
      vm.current_user = response;
      TokenService.get_token(vm.current_user.id).then(
        function(response) {
          vm.token = response;
        },
        function(rejection){
          vm.token = rejection;
        }
      );
    },
    function(rejection) {
      vm.current_user = rejection;
    });

  vm.resetToken = function() {
    TokenService.reset_token(vm.current_user.id).then(
        function(response) {
          vm.token = response;
        },
        function(rejection){
          vm.token = rejection;
        }
      )
  };

}]);





