app.controller("questions", function($scope,$resource) {


    Questions = $resource('/questions/:id', {id:'@id'},{
        query: {method:'get', isArray: true ,headers: { 'Accept': 'application/json' } }


    });

    New_Window=null;


    $scope.questions=Questions.query();

    $scope.question = new Questions();
    $scope.question.answers = ["","","","",""]

    $scope.Add_question= function () {

        question= $scope.question

        Questions.save(question,function (data) {

            $scope.questions.push(data);
            $scope.question = new Questions();
            $scope.question.answers = ["","","","",""]
        })

    }


    $scope.Delete_question = function (index) {

        question=$scope.questions[index];
        $scope.questions.splice(index,1);

        Questions.delete(question);
    }

    $scope.open_window = function (url) {

        if(New_Window != null && New_Window.parent != null) {
            New_Window.location = url
        }
        else {
            New_Window= window.open()
            New_Window.location = url

        }

    }

});