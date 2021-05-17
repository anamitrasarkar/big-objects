public with sharing class SalesOrderController {
    public SalesOrderController() {

    }
    @AuraEnabled
    public static List<Order__b> getOrders (String accountId) {
        List<Account> acctRecord = new List<Account>();
        List<Case> caseRecord = new List<Case>();
        String recordId;
        //check if the id is invoked from case or account object.
        //currently, it is supported only in account and case record pages.
        String recordIdentifier = accountId.left(3);
        System.debug(LoggingLevel.debug, '---> record identifier ' + recordIdentifier);
        if(recordIdentifier.equals('001')) {
            acctRecord = [SELECT Id, Name FROM Account WHERE Id = :accountId LIMIT 1];
            recordId = acctRecord[0].Id;
        }else if(recordIdentifier.equals('500')) {
            caseRecord = [SELECT Id, AccountId FROM Case WHERE Id = :accountId LIMIT 1];
            recordId = caseRecord[0].AccountId;
        }

        System.debug(LoggingLevel.debug, '---> record Id ' + recordId);
        List<Order__b> orders = [SELECT Id, Account__c, Amount__c, Channel__c, Product_Id__c, Transaction_DateTime__c
                            FROM Order__b
                            WHERE Account__c = :recordId];
        return orders;
    }
}
