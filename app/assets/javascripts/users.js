app.controller("usersadmin", function($scope,$resource) {


    Users = $resource('/users/:id', {id:'@id'},{
        query: {method:'get', isArray: true ,headers: { 'Accept': 'application/json' } }


    });

    $scope.users=Users.query();

});