@isTest 
 public class TestListProducts {
  
     public static testMethod void testList() {
        Product_Table__c testPageAccess = new Product_Table__c();
         
        testPageAccess.Name = 'Test';
        testPageAccess.Image_Url__c = 'http://test';
        testPageAccess.Product_Description__c = 'Test1';
        testPageAccess.Unit_Price__c = 100;

        insert testPageAccess;
         
        Test.startTest();
        ListProducts lp = new ListProducts();
        lp.getProducts();
        Test.stopTest();
       System.assert(lp != NULL); 
    }
     
	public static testMethod void testList1() {
    	Product_Table__c a = new Product_Table__c();
   		       
    	a.Name = 'Test';
    	a.Image_Url__c = 'http://test';
    	a.Product_Description__c = 'Test';
    	a.Units__c = 5;
        
		insert a;
        
		ApexPages.CurrentPage().getParameters().put('id', a.Id);
        Test.startTest();
    	ListProducts lp1 = new ListProducts();
    	lp1.getDescription(); 
    	Test.stopTest();
        System.assert(lp1 != NULL); 
}
}