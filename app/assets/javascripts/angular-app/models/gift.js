angular
    .module('app')
    .factory('Gift', function ($resource) {

        var Gift = $resource('http://localhost:3000/api/v1/gifts/:id.json', {id: '@id'}, {
            update: {
                method: 'PUT'
            }
        });
        return Gift;

    });