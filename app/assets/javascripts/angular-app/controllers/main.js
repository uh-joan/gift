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

        $scope.gift = Gift.get({id:$routeParams.giftId});

        $scope.newPurchase = new Purchase();

//        $scope.purchaseId = 0;

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
                        $scope.goto(purchase.id);//redirect to pay
                    });
            });
        };

        $scope.goto = function (path) {
            //console.log("#/agifts/pay/"+ path);
            $location.path ("agifts/pay/"+ path);

        }
        //$scope.giftId = $routeParams.giftId;

    }])
    .controller('GiftPayCtrl', ['$scope', 'Charge', 'Purchase', '$routeParams', '$location', function ($scope, Charge, Purchase, $routeParams, $location){

        $scope.backHomeButtonVisible = false;

        $scope.toggleHomeButtonVisible = function (){
            $scope.backHomeButtonVisible  = !$scope.backHomeButtonVisible ;
        };

        $scope.purchase = Purchase.get({id:$routeParams.purchaseId});

        $scope.newCharge = new Charge();

        $scope.stripeCallback = function (status, token) {
            if (token.error) {
                console.log('it failed! error: ' + token.error.message);
            }
            else {
                console.log('Token: ' + token.id);

                $scope.newCharge.stripeToken = token.id;
                $scope.newCharge.email = $scope.purchase.senderEmail;
                $scope.newCharge.identifier = $scope.purchase.identifier;
                $scope.newCharge.amount = ($scope.purchase.amount*105)+30;
                $scope.newCharge.$save(function (response){
                    Charge.get ({id:response.id}).$promise.then(
                        function (charge) {
                            console.log('Charge: ' + charge.amount);
                        });
                });
                $scope.toggleHomeButtonVisible();
                console.log('Success! Payment made to stripe');
                //$location.path('agifts')
            }
        };
}])
;