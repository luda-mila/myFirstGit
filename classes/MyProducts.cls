public class MyProducts {
private String sortOrder = 'Name';
    
public List<Product_Table__c> getProducts() {
    
    List<Product_Table__c> results = Database.query(
        'SELECT Image_Url__c, Name, Product_Description__c, Unit_Price__c FROM Product_Table__c ORDER BY ' + sortOrder + ' ASC '
    );
    return results;
}
   public PageReference save() {
     return null;  
    }

 public Product_Table__c getDescription() {

        return [SELECT Id, Name, Product_Description__c, Unit_Price__c FROM Product_Table__c 
                WHERE Id = :ApexPages.currentPage().getParameters().get('Id')];
    }

}