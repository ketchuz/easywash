app = angular.module 'easyWash'

app.controller 'TranslateLanguageSelectCtrl', [ '$scope', 'LocaleService', ($scope, LocaleService) ->

	$scope.currentLocaleDisplayName = LocaleService.getLocaleDisplayName()
	$scope.localesDisplayNames = LocaleService.getLocalesDisplayNames()
	$scope.visible = $scope.localesDisplayNames && $scope.localesDisplayNames.length > 1
    
	$scope.changeLanguage = (locale) ->
		LocaleService.setLocaleByDisplayName locale

]