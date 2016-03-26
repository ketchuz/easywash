app = angular.module 'easyWash'

app.controller 'HomeCtrl', [ '$scope', ($scope) ->

	$scope.contact = 'This is an Tommy'
	$scope.sayHi = () ->
		alert('hello tomy')

]