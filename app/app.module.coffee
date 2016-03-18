app = angular.module 'easyWash', ['ngCookies', 'pascalprecht.translate', 'tmh.dynamicLocale']

app.config ['$translateProvider', 'tmhDynamicLocaleProvider', ($translateProvider, tmhDynamicLocaleProvider) ->

	$translateProvider.useMissingTranslationHandlerLog();
	$translateProvider.useSanitizeValueStrategy('escape');

	$translateProvider.useStaticFilesLoader
		prefix: 'resources/locale-'
		suffix: '.json'

	$translateProvider.preferredLanguage 'es-MX'
	$translateProvider.useLocalStorage()

	tmhDynamicLocaleProvider.localeLocationPattern('assets/bower_components/angular-i18n/angular-locale_{{locale}}.js');


]
