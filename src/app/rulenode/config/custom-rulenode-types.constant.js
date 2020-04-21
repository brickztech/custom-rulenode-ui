export default angular.module('thingsboard.ruleChain.config.customTypes', [])
    .constant('customRuleNodeTypes', {
            aggregateFunction: [
                'AVG',
                'MAX',
                'MIN',
                'SUM'
            ]
        }
    ).name;
