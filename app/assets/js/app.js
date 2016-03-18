(function() {
  var app;

  app = angular.module('easyWash', ['ngCookies', 'pascalprecht.translate', 'tmh.dynamicLocale']);

  app.config([
    '$translateProvider', 'tmhDynamicLocaleProvider', function($translateProvider, tmhDynamicLocaleProvider) {
      $translateProvider.useMissingTranslationHandlerLog();
      $translateProvider.useSanitizeValueStrategy('escape');
      $translateProvider.useStaticFilesLoader({
        prefix: 'resources/locale-',
        suffix: '.json'
      });
      $translateProvider.preferredLanguage('es-MX');
      $translateProvider.useLocalStorage();
      return tmhDynamicLocaleProvider.localeLocationPattern('assets/bower_components/angular-i18n/angular-locale_{{locale}}.js');
    }
  ]);

}).call(this);

(function() {


}).call(this);

(function() {
  var app;

  app = angular.module('easyWash');

  app.controller('HomeCtrl', [
    '$scope', function($scope) {
      return $scope.contact = 'This is an user';
    }
  ]);

}).call(this);

(function() {
  var app;

  app = angular.module('easyWash');

  app.directive('ngTranslateLanguageSelect', [
    'LocaleService', function(LocaleService) {
      'use strict';
      return {
        restrict: 'A',
        replace: true,
        controller: 'TranslateLanguageSelectCtrl',
        templateUrl: 'shared/translations/languageSelectTemplate.html'
      };
    }
  ]);

}).call(this);

(function() {
  var app;

  app = angular.module('easyWash');

  app.service('LocaleService', [
    '$translate', 'LOCALES', '$rootScope', 'tmhDynamicLocale', function($translate, LOCALES, $rootScope, tmhDynamicLocale) {
      var _LOCALES, _LOCALES_DISPLAY_NAMES, checkLocaleIsValid, currentLocale, localesObj, setLocale;
      localesObj = LOCALES.locales;
      _LOCALES = Object.keys(localesObj);
      if (!_LOCALES || _LOCALES.length === 0) {
        console.error('No locales provided');
      }
      _LOCALES_DISPLAY_NAMES = [];
      _LOCALES.forEach(function(locale) {
        return _LOCALES_DISPLAY_NAMES.push(localesObj[locale]);
      });
      currentLocale = $translate.proposedLanguage();
      checkLocaleIsValid = function(locale) {
        return _LOCALES.indexOf(locale !== -1);
      };
      setLocale = function(locale) {
        if (!checkLocaleIsValid(locale)) {
          console.error('Locale name ' + locale + ' is invalid');
          return;
        }
        currentLocale = locale;
        return $translate.use(locale);
      };
      $rootScope.$on('$translateChangeSuccess', function(event, data) {
        document.documentElement.setAttribute('lang', data.language);
        return tmhDynamicLocale.set(data.language.toLowerCase().replace(/_/g, '-'));
      });
      return {
        getLocaleDisplayName: function() {
          return localesObj[currentLocale];
        },
        setLocaleByDisplayName: function(localeDisplayName) {
          return setLocale(_LOCALES[_LOCALES_DISPLAY_NAMES.indexOf(localeDisplayName)]);
        },
        getLocalesDisplayNames: function() {
          return _LOCALES_DISPLAY_NAMES;
        }
      };
    }
  ]);

}).call(this);

(function() {
  var app;

  app = angular.module('easyWash');

  app.constant('LOCALES', {
    'locales': {
      'es-MX': 'Español',
      'en-US': 'English'
    },
    'preferredLocale': 'es-MX'
  });

}).call(this);

(function() {
  var app;

  app = angular.module('easyWash');

  app.controller('TranslateLanguageSelectCtrl', [
    '$scope', 'LocaleService', function($scope, LocaleService) {
      $scope.currentLocaleDisplayName = LocaleService.getLocaleDisplayName();
      $scope.localesDisplayNames = LocaleService.getLocalesDisplayNames();
      $scope.visible = $scope.localesDisplayNames && $scope.localesDisplayNames.length > 1;
      return $scope.changeLanguage = function(locale) {
        return LocaleService.setLocaleByDisplayName(locale);
      };
    }
  ]);

}).call(this);
