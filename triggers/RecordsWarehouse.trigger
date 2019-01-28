trigger RecordsWarehouse on Product_Table__c (before insert) {
    if (trigger.isBefore && trigger.isInsert){
           CreateNewProducts.HandlerNewProducts(Trigger.new); 
    }
}