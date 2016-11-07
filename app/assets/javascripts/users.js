app.controller("usersadmin", function($scope,$resource) {


    Users = $resource('/users/:id', {id:'@id'},{
        query: {method:'get', isArray: true ,headers: { 'Accept': 'application/json' } }


    });

    $scope.users=Users.query();
    $scope.user = new Users();

    $scope.Delete_user = function (index) {

        user=$scope.users[index];
        $scope.users.splice(index,1);

        Users.delete(user);
    };

});