// Only after insert is supported now.
trigger onTransactionsInsertAsync on Transactions__ChangeEvent (after insert) {
	List<Transactions__ChangeEvent> trxs = Trigger.new;
    Set<String> ids = new Set<String>();
    // store all the transaction header for further processing
    for(Transactions__ChangeEvent trx : trxs) {
		List<String> recordIds = trx.ChangeEventHeader.getRecordIds();  
        ids.addAll(recordIds);
    }
    
    //Now you have all ids of Transactions__c object
    //Compute and then isert/update Transactions_Rollup__c based use cases.
}