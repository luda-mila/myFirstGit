public class MyOrder {
    public Contact contact {get; set;}
    public Product_Table__c product {get; set;}
    public Contact emailContact {get; set;}
    public Order_Table__c order {get; set;}
    public Order_Table__c order1 {get; set;}
   
    
        public MyOrder() {
        product = [SELECT Id, Name, Unit_Price__c, Units__c FROM Product_Table__c 
                WHERE Id = :ApexPages.currentPage().getParameters().get('Id')];
         
        contact = new Contact(); 
         System.debug(contact);   
        order = new Order_Table__c ();
             
            
            
        }
    public PageReference myContact()
    { 
        List<Contact> emailContact = new List<Contact>([SELECT Id, FirstName, LastName, Email FROM Contact WHERE Email = :contact.Email]);
      System.debug(emailcontact);
        Order_Table__c order1 = new Order_Table__c (BasketProducts__c = product.Id, Units__c = order.Units__c, Order_Amount__c = order.Units__c * product.Unit_Price__c, Order__c = contact.Id);
       
        product.Units__c = product.Units__c - order.Units__c; 
       
        if (product.Units__c>=0)
        {
           
        update product;
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.INFO, 'The purchase was successful');
            ApexPages.addMessage(myMsg);    
              
 
       // List<Contact> emailContact = new List<Contact>([SELECT Id, FirstName, LastName, Email FROM Contact WHERE Email = :contact.Email]);
      
       if (!emailContact.isEmpty())
        {
            emailContact[0].FirstName=contact.FirstName;
            emailContact[0].LastName=contact.LastName;
            update emailContact;
        }
        else 
        {
           insert contact;
        }
       // Order_Table__c order1 = new Order_Table__c (BasketProducts__c = product.Id, Units__c = order.Units__c, Order_Amount__c = order.Units__c * product.Unit_Price__c, Order__c = contact.Id);
        insert order1;
         } 
                    else
            {
            ApexPages.Message myMsg1 = new ApexPages.message(ApexPages.Severity.ERROR, 'The requested quantity is not in the store' ); 
            ApexPages.addMessage(myMsg1);
            }
       return NULL;
   }
    public PageReference cancel(){
          PageReference retPage = new PageReference('/apex/ListProducts1');
       retPage.setRedirect(true);
return retPage; }
}