public class ListProducts1 {
    public Product_Table__c getDescription() {
        Product_Table__c results1 = [SELECT Id, Name, Product_Description__c, Unit_Price__c FROM Product_Table__c 
                WHERE Id = :ApexPages.currentPage().getParameters().get('Id')];
    return results1;
    }

}