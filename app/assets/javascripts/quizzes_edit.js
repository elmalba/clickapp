app.controller("quizzes_edit", function($scope,$resource) {


    Quizzes = $resource('/quizzes/:id.json', {id:'@id'},{
        query: {method:'get', isArray: true ,headers: { 'Accept': 'application/json' } }
        , 'update': { method:'PUT' }

    });

    $scope.quizzes=Quizzes.query();

    var pathArray = window.location.pathname.split( '/' );
    var id = pathArray[2];

    $scope.quiz = Quizzes.get({id: id});

    $scope.Edit_quiz= function () {

        quiz= $scope.quiz

        Quizzes.update(quiz,function (data) {

            $scope.quiz = Quizzes.get({id: id});
        })

        window.location.reload();
    }


});