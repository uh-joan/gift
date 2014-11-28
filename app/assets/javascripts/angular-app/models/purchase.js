angular
    .module('app')
    .factory('Purchase', function ($resource) {

        var Purchase = $resource('http://localhost:3000/api/v1/purchases/:id.json', {id: '@id'}, {
            update: {
                method: 'PUT'
            }
        });
        return Purchase;

    });