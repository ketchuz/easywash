app = angular.module 'easyWash'

app.config [ '$routeProvider', '$locationProvider', ($routeProvider, $locationProvider) ->
	

	$routeProvider
		.when '/',
			templateUrl: '../../components/home/home.html'
			controller: 'HomeCtrl'
		.when '/services',
			templateUrl: '../../components/services/services.html'
		.otherwise
            redirectTo: '/'

    $locationProvider.html5Mode false 

        

]