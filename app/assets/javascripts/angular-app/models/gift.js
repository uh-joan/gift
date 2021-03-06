angular
    .module('app')
    .factory('Gift', ['$resource', function ($resource) {

        //var Gift = $resource('http://localhost:3000/api/v1/gifts/:id.json', {id: '@id'}, {
        //var Gift = $resource('http://sheltered-brook-3657.herokuapp.com/api/v1/gifts/:id.json', {id: '@id'}, {
        var Gift = $resource('/api/v1/gifts/:id.json', {id: '@id'}, {
            update: {
                method: 'PUT'
            }
        });
        return Gift;

    }]);