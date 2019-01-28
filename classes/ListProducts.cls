public class ListProducts {
   
    
public List<Product_Table__c> getProducts() {
    
    List<Product_Table__c> results = [SELECT Id, Image_Url__c, Name, Product_Description__c, Unit_Price__c FROM Product_Table__c];
   System.debug(results);
    return results;
    
}
    
public Product_Table__c getDescription() {
        Product_Table__c results1 = [SELECT Id, Name, Image_Url__c, Product_Description__c, Units__c FROM Product_Table__c 
                WHERE Id = :ApexPages.currentPage().getParameters().get('Id')];
    System.debug('Id' + ApexPages.currentPage().getParameters().get('Id'));
    System.debug(results1);
    return results1;
    
    }
    
}