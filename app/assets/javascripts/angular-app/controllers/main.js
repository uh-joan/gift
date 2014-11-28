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
    .controller('GiftPurchaseCtrl', ['Gift', 'Purchase', '$scope', '$routeParams', function (Gift, Purchase, $scope, $routeParams) {

        //$scope.gifts = Gift.query();

        $scope.gift = Gift.get({id:$routeParams.giftId});

//        $scope.purchases = Purchase.query();

        $scope.newPurchase = new Purchase();

        $scope.save = function (p){
            $scope.newPurchase.completed=false;
            $scope.newPurchase.comfirmedPayment=false;
            $scope.newPurchase.status="confirming";
            $scope.newPurchase.vendor = $scope.gift.title;
            console.log(p);
            p.$save();
        };

        //$scope.giftId = $routeParams.giftId;

    }]);