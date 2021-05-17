public with sharing class OrdersDataBatchController implements Database.Batchable<SObject>, Database.Stateful{
    public OrdersDataBatchController() {

    }
    public Iterable<sObject> start(Database.BatchableContext bc) {
        // collect the batches of records or objects to be passed to execute
        return null;
    }
    public void execute(Database.BatchableContext bc, List<Account> records){
        // process each batch of records
    }
    public void finish(Database.BatchableContext bc){
        // execute any post-processing operations
    }    
}
