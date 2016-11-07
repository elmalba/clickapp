app.controller("courses_request", function($scope,$resource) {


    Courses = $resource('/courses/:id', {id:'@id'},{
        query: {method:'get', isArray: true ,headers: { 'Accept': 'application/json' } } , 'update': { method:'PUT' }

    });

    Users = $resource('/users/:id', {id:'@id'},{
        query: {method:'get', isArray: true ,headers: { 'Accept': 'application/json' } }

    });


    var pathArray = window.location.pathname.split( '/' );
    var id = pathArray[2];

    $scope.course = Courses.get({id: id}); //Obtiene el id del curso


    //https://spin.atomicobject.com/2013/11/22/pass-rails-data-angularjs/
    function itemsControllerHiddenDiv ($scope) {//courses/show linea 51
        var div = document.getElementById('div-item-data');
        var id = div.getAttribute("data-item-id");

        $scope.user = Users.get({id: id});//obtiene el id del usuario?
    };

//Actualiza el curso course, busca el id del usuario user en "request", lo borra y lo agrega en "students"
    $scope.acceptRequest_course = function (course, user) {
        $scope.course.splice(user, 1);
        Courses.update(course);
    };

//Borra el id del usuario user del arreglo "request" en el curso course
    $scope.deleteRequest_course = function (course, user) {
        Request.save(course)
    };


});