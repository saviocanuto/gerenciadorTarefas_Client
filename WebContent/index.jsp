<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html ng-app="tarefaApp">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Angular JS e Restful</title>

<script type="text/javascript" src="js/angular.min.js"></script>
<script type="text/javascript" src="js/app.js"></script>

</head>
<body ng-controller="tarefaController">

<table cellpadding="2" cellspacing="2" border="1">
	<tr>
		<th>Id</th>
		<th>Nome</th>
		<th>Responsavel</th>
		<th>Prazo</th>
	</tr>
	<tr ng-repeat="tar in tarefas">
		<td>{{tar.id}}</td>
		<td>{{tar.nome}}</td>
		<td>{{tar.responsavel}}</td>
		<td>{{tar.prazo}}</td>
	</tr>
</table>

<script type="text/javascript">
	var myapp = angular.module('tarefaApp', []);
	myapp.controller('tarefaController', function($scope, $http){
		$http.get('http://localhost:9090/todos').success(function(response){
			$scope.tarefas = response.tarefas;
		});
	});

</script>

</body>
</html>