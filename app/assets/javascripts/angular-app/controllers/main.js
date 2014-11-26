angular
    .module('app')
    .controller('MainCtrl', ['Gift', '$scope', function (Gift, $scope) {

        $scope.gifts = Gift.query();

    }])
    .controller('GiftDetailCtrl', ['Gift', '$scope', '$routeParams', function (Gift, $scope, $routeParams) {

        //$scope.gifts = Gift.query();

        $scope.gift = Gift.get({id:$routeParams.giftId});

        //$scope.giftId = $routeParams.giftId;

    }])
    .controller('GiftPurchaseCtrl', ['Gift', '$scope', '$routeParams', function (Gift, $scope, $routeParams) {

        //$scope.gifts = Gift.query();

        $scope.gift = Gift.get({id:$routeParams.giftId});

        //$scope.giftId = $routeParams.giftId;

    }]);