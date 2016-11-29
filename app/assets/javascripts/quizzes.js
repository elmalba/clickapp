app.controller("quizzes", function($scope,$resource) {


    Quizzes = $resource('/quizzes/:id', {id:'@id'},{
        query: {method:'get', isArray: true ,headers: { 'Accept': 'application/json' } }


    });


    $scope.quizzes=Quizzes.query();

    $scope.quiz = new Quizzes();

    $scope.Add_quiz= function () {

        quiz= $scope.quiz;

        Quizzes.save(quiz,function (data) {

            $scope.quizzes.push(data);
            $scope.quiz = new Quizzes();
        })
        window.location.reload();

    };

    $scope.Delete_quiz = function(item) {

        var index = $scope.quizzes.indexOf(item);

        quiz=$scope.quizzes[index];
        $scope.quizzes.splice(index,1);

        Quizzes.delete(quiz);
    };



});