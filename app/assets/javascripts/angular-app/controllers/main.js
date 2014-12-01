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
    .controller('GiftPurchaseCtrl', ['Gift', 'Purchase', '$location', '$scope', '$routeParams', function (Gift, Purchase, $location, $scope, $routeParams) {

        //$scope.gifts = Gift.query();

        $scope.gift = Gift.get({id:$routeParams.giftId});

//        $scope.purchases = Purchase.query();

        $scope.newPurchase = new Purchase();

        $scope.purchaseId = 0;

        $scope.save = function (p){
            $scope.newPurchase.completed=false;
            $scope.newPurchase.comfirmedPayment=false;
            $scope.newPurchase.status="confirming";
            $scope.newPurchase.vendor = $scope.gift.title;

            p.$save(function (response) {
                //$scope.purchaseId = response.id;
                //console.log($scope.purchaseId);

                Purchase.get ({id:response.id}).$promise.then(
                    function (purchase){
                        $scope.goto(purchase.id);
                    });
            });
        };

        $scope.goto = function (path) {
            console.log("#/agifts/pay/"+ path);
            $location.path ("agifts/pay/"+ path);

        }
        //$scope.giftId = $routeParams.giftId;

    }])
    .controller('GiftPayCtrl', ['$scope', 'Purchase', '$routeParams', function ($scope, Purchase, $routeParams){

        $scope.purchase = Purchase.get({id:$routeParams.purchaseId});

        $scope.stripeCallback = function (code, result) {
            if (result.error) {
                console.log('it failed! error: ' + result.error.message);
            }
            else {
                console.log('Success! token: ' + result.id);
            }
        };

}]);
//    .controller('GiftPayCtrl', ['stripe', function (stripe) {
//    }])
//;