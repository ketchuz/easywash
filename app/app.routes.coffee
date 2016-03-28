app = angular.module 'easyWash'

app.config [ '$routeProvider', '$locationProvider', ($routeProvider, $locationProvider) ->
	

	$routeProvider
		.when '/',
			templateUrl: '../../components/home/home.html'
			controller: 'HomeCtrl'
		.when '/philosophy',
			templateUrl: '../../components/philosophy/philosophy.html'
		.when '/company',
			templateUrl: '../../components/company/company.html'
		.when '/services',
			templateUrl: '../../components/services/services.html'
		.when '/servicepoints',
			templateUrl: '../../components/service-points/servicePoints.html'
		.when '/franchise',
			templateUrl: '../../components/franchise/franchise.html'
		.otherwise
            redirectTo: '/'

    $locationProvider.html5Mode false 

        

]