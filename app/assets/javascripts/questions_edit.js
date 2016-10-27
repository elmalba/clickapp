app.controller("questions_edit", function($scope,$resource) {


    Questions = $resource('/questions/:id', {id:'@id'},{
        query: {method:'get', isArray: true ,headers: { 'Accept': 'application/json' } }
        , 'update': { method:'PUT' }

    });

    $scope.questions=Questions.query();

    var pathArray = window.location.pathname.split( '/' );
    var id = pathArray[2];

    $scope.question = Questions.get({id: id});
    $scope.question.answers = ["","","",""]

    $scope.Update_question= function () {

        question= $scope.question

        Questions.update(question,function (data) {

        })
    }


});