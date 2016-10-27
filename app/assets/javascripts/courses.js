app.controller("courses", function($scope,$resource) {


    Courses = $resource('/courses/:id', {id:'@id'},{
        query: {method:'get', isArray: true ,headers: { 'Accept': 'application/json' } }


    });

    Request = $resource('/request', null,{
        query: {method:'get', isArray: true ,headers: { 'Accept': 'application/json' } }


    });


    $scope.courses=Courses.query();

    $scope.course = new Courses();

    $scope.Add_course= function () {

        course= $scope.course;

        Courses.save(course,function (data) {

            $scope.courses.push(data);
            $scope.course = new Courses();
    })


};


    $scope.Delete_course = function (index) {

    course=$scope.courses[index];
    $scope.courses.splice(index,1);

        Courses.delete(course);
    };


    $scope.joinRequest_course = function (course) {
    Request.save(course)
    };
//Actualiza el curso course, busca el id del usuario user en "request", lo borra y lo agrega en "students"
    $scope.acceptRequest_course = function (course, user) {
        $scope.course.splice(user, 1);
    };

//Borra el id del usuario user del arreglo "request" en el curso course
    $scope.deleteRequest_course = function (course, user) {
        Request.save(course)
    };


});