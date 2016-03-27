app = angular.module 'easyWash'

app.controller 'contactFormCtrl', [ '$scope', ($scope) -> 

	$scope.test = 'Contorller '

	$scope.sendForm = () ->
		alert 'Sending form'

]