app = angular.module 'easyWash'

app.config [ '$routeProvider', '$locationProvider', ($routeProvider, $locationProvider) ->

	$locationProvider.html5Mode
	  enabled: true
	  requireBase: false
	

	$routeProvider
		.when '/',
			templateUrl: '../../components/home/home.html'
			controller: 'HomeCtrl'
		.otherwise
            redirectTo: '/'
        

]