angular
    .module('app')
    .factory('Charge', function ($resource) {

        var Charge = $resource('http://localhost:3000/api/v1/charges/:id.json', {id: '@id'}, {
            update: {
                method: 'PUT'
            }
        });
        return Charge;

    });