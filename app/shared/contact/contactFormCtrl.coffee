app = angular.module 'easyWash'

app.controller 'contactFormCtrl', [ '$scope', '$http', ($scope, $http) -> 


	$scope.contact

	$scope.sendForm = (contact) ->
		console.log contact

		$http.post("http://localhost:3000/sendEmail", {myContact: contact}).success (data, status) ->
            console.log data;

        alert 'Muchas gracias! Pronto nos pondremos en conacto con usted.'
        $scope.contact = null

]