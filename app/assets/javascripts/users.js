app.controller("users", function($scope,$resource) {


    Users = $resource('/users/:id', {id:'@id'},{
        query: {method:'get', isArray: true ,headers: { 'Accept': 'application/json' } }


    });

    $scope.users=Users.query();
    $scope.user = new Users();


    $scope.Delete_user = function(item) {

        var index = $scope.users.indexOf(item);

        user=$scope.users[index];
        $scope.users.splice(index,1);

        Users.delete(user);
    };

    $scope.Name_user = function(id) {
        var index = $scope.users.indexOf(item);

        user=$scope.users[index];
        user.data('name');
        console.log()
    };


});