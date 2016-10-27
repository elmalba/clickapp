app.controller("questions", function($scope,$resource) {


    Questions = $resource('/questions/:id', {id:'@id'},{
        query: {method:'get', isArray: true ,headers: { 'Accept': 'application/json' } }


    });


    $scope.questions=Questions.query();

    $scope.question = new Questions();
    $scope.question.answers = ["","","",""]

    $scope.Add_question= function () {

        question= $scope.question

        Questions.save(question,function (data) {

            $scope.questions.push(data);
            $scope.question = new Questions();


        })

    }


    $scope.Delete_question = function (index) {

        question=$scope.questions[index];
        $scope.questions.splice(index,1);

        Questions.delete(question);
    }

});