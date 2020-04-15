
/* eslint-disable import/no-unresolved, import/default */

import getTelemetryAndSumConfigTemplate from './get-telemetry-and-sum-config.tpl.html';

/* eslint-enable import/no-unresolved, import/default */

/*@ngInject*/
export default function GetTelemetryAndSumConfigDirective($compile) {

    var linker = function (scope, element, attrs, ngModelCtrl) {
        var template = getTelemetryAndSumConfigTemplate;
        element.html(template);


        scope.$watch('configuration', function (newConfiguration, oldConfiguration) {
            if (!angular.equals(newConfiguration, oldConfiguration)) {
                ngModelCtrl.$setViewValue(scope.configuration);
            }
        });

        ngModelCtrl.$render = function () {
            scope.configuration = ngModelCtrl.$viewValue;
        };

        $compile(element.contents())(scope);
    };

    return {
        restrict: "E",
        require: "^ngModel",
        scope: {},
        link: linker
    };
}
