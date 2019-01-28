@isTest
public class TestProducts {
   @isTest 
    public static void TestMyOrder() {
     
Product_Table__c pt = new Product_Table__c ();
    pt.Name='Ochki';
    pt.Unit_Price__c = 100;
    pt.Units__c = 10;
    insert pt;      	
    ApexPages.CurrentPage().getParameters().put('id', pt.id);
        
    	 Contact c = new Contact(FirstName = 'Artem',
                                LastName = 'Pashkevich',
                                email = 'artpash@tut.by');
        insert c;
      	System.debug(c);
        Contact c1 = [Select Id, FirstName, LastName, email From Contact];
      
    Order_Table__c ot = new Order_Table__c(BasketProducts__c= pt.id,
                                           Units__c=1,
                                           Order_Amount__c=100,
    									   Order__c=c.id);
   		 insert ot;
         System.debug(ot);
        Order_Table__c ot1 = [Select Id, BasketProducts__c, Units__c, Order_Amount__c, Order__c  From Order_Table__c];
        
		Test.startTest();
      
		MyOrder m = new MyOrder();
        m.contact = c;
        m.order = ot;
        m.myContact();
        m.cancel();

        Test.stopTest();
   }
    @isTest 
    public static void TestMyOrder1() {
     
Product_Table__c pt = new Product_Table__c ();
    pt.Name='Ochki';
    pt.Unit_Price__c = 100;
    pt.Units__c = 10;
    insert pt;      	
    ApexPages.CurrentPage().getParameters().put('id', pt.id);
        
    	 Contact c = new Contact(FirstName = 'Artem',
                                LastName = 'Pashkevich',
                                email = 'artpash@tut.by');
        insert c;
      	System.debug(c);
        Contact c1 = [Select Id, FirstName, LastName, email From Contact];
      
    Order_Table__c ot = new Order_Table__c(BasketProducts__c= pt.id,
                                           Units__c=11,
                                           Order_Amount__c=1100,
    									   Order__c=c.id);
   		 insert ot;
         System.debug(ot);
        Order_Table__c ot1 = [Select Id, BasketProducts__c, Units__c, Order_Amount__c, Order__c  From Order_Table__c];
        
		Test.startTest();
      //  PageReference pageRef = Page.MyOrder;
      //  Test.setCurrentPage(pageRef);
		MyOrder m = new MyOrder();
        m.contact = c;
        m.order = ot;
        m.myContact();
        m.cancel();

        Test.stopTest();
   }
}