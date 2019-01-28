public class CreateNewProducts {
    public static void HandlerNewProducts (List<Product_Table__c> newProducts)
    {
      Integer oc = (Integer)[SELECT Period_Term__c FROM Org_Configuration__c][0].Period_Term__c;
    List<Warehouse__c> wh = new List<Warehouse__c>([SELECT Id, Period_Start__c, Period_End__c FROM Warehouse__c ]);

    List<Warehouse__c> newWarehouse = new List<Warehouse__c>();
        
        for(Product_Table__c i :newProducts) {
           
            if (i.Added_Date__c==NULL){
                i.Added_Date__c=Date.today();
            }
            	
            for (Warehouse__c j :wh){
           
            	if ((j.Period_Start__c<=i.Added_Date__c) && (j.Period_End__c >= i.Added_Date__c)){
                i.Basket__c=j.Id; 
                }
                else  {
                newWarehouse.add(new Warehouse__c(Name = 'Warehouse' + i.Added_Date__c+' '+i.Added_Date__c.addDays (oc),
                                                     Period_Start__c=i.Added_Date__c,
                                                 	 Period_End__c=i.Added_Date__c.addDays (oc)));
                } 
            }
        }
    insert newWarehouse;
        Integer i=0;
         for (Integer j=0; j<newProducts.size(); j++){
             if (newProducts[j].Basket__c==NULL) {
              newProducts[j].Basket__c = newWarehouse[i].Id; 
                 i++;
             }
        } 
        
       // for (Product_Table__c n :newProducts){
        //    for (Warehouse__c m :newWarehouse){
          //      n.Basket__c = m.Id;
            
   		
	}
}