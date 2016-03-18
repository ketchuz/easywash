app = angular.module 'easyWash'

app.service 'LocaleService', [  '$translate', 'LOCALES', '$rootScope', 'tmhDynamicLocale', ($translate, LOCALES, $rootScope, tmhDynamicLocale) -> 

	localesObj = LOCALES.locales
	_LOCALES = Object.keys(localesObj)

	if !_LOCALES || _LOCALES.length == 0
		console.error 'No locales provided'

	_LOCALES_DISPLAY_NAMES = []
	_LOCALES.forEach (locale) ->
		_LOCALES_DISPLAY_NAMES.push localesObj[locale]

	currentLocale = $translate.proposedLanguage()

	checkLocaleIsValid = (locale) ->
		_LOCALES.indexOf locale != -1

	setLocale = (locale) ->
		if !checkLocaleIsValid locale
			console.error 'Locale name ' + locale + ' is invalid'
			return

		currentLocale = locale
		$translate.use locale

	$rootScope.$on '$translateChangeSuccess', (event, data) ->
		document.documentElement.setAttribute 'lang', data.language
		tmhDynamicLocale.set data.language.toLowerCase().replace /_/g, '-'

	return {
	      getLocaleDisplayName: () ->
	        return localesObj[currentLocale]
	      ,
	      setLocaleByDisplayName: (localeDisplayName) ->
	        setLocale(
	          _LOCALES[ _LOCALES_DISPLAY_NAMES.indexOf localeDisplayName  ]
	        )
	      ,
	      getLocalesDisplayNames: () ->
	        return _LOCALES_DISPLAY_NAMES;
	    };
      


]