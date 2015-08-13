angular.module('tarefaApp', [])
.factory('tarefaController', ['$http', function($http) {

    function listar(callback) {
        $http({
            method:'GET',
            url:'http://localhost:9090/todos'
        }).success(function (data) {
            if (callback) callback(data)
        });
    }

    function salvar(tarefa, callback) {
        $http({
            method:'POST',
            url:'http://localhost:9090/tarefa/salvar',
            data:JSON.stringify(tarefa)
        }).success(function (data) {
            if (callback) callback(data)
        });
    }

    return {
        listar:listar
        //salvar:salvar
    };
}])
.controller('tarefaController', ['$scope', 'tarefaController',function($scope, tarefaController) {

	tarefaController.listar(function(tarefas) {
        $scope.tarefas = tarefas;
    });

    $scope.salvar = function(tarefa) {
        tarefaService.salvar(tarefa, function(tarefa) {
            $scope.tarefas.push(tarefa);
        });
    }
}]);