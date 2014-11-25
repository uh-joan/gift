angular
    .module('app', ['ngRoute', 'ngResource', 'templates'])
    .config(['$routeProvider', function($routeProvider) {
        $routeProvider.
            when('/agifts', {
                templateUrl : 'gift-list.html',
                controller: 'MainCtrl'
        }).
            when('/agifts/:giftId', {
                templateUrl : 'gift-detail.html',
                controller: 'GiftDetailCtrl'
        }).
            otherwise({
                redirectTo: '/agifts'
        });
    }]);