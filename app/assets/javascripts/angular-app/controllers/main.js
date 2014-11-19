angular
    .module('app')
    .controller('MainCtrl', ['Gift', '$scope', function (Gift, $scope) {

        $scope.gifts = Gift.query();

    }]);