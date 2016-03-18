app = angular.module 'easyWash'

app.directive 'ngTranslateLanguageSelect', [ 'LocaleService', (LocaleService) ->

	'use strict'

	restrict: 'A'
	replace: true    
	controller: 'TranslateLanguageSelectCtrl'
	templateUrl: 'shared/translations/languageSelectTemplate.html'


]