angular
    .module('app', ['ngRoute', 'ngResource', 'templates', 'angularPayments'])
    //.config(function() {
    //    Stripe.setPublishableKey('pk_test_pim5DmVFetHEZO75KX8rAL1K');
    //})
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
            when('/agifts/purchase/:giftId', {
                templateUrl : 'gift-purchase.html',
                controller: 'GiftPurchaseCtrl'
        }).
            when('/agifts/pay/:purchaseId', {
                templateUrl : 'gift-pay.html',
                controller: 'GiftPayCtrl'
        }).
        otherwise({
            redirectTo: '/agifts'
        });
    }]);
