trigger ToyCheckbox on Toy__c (before insert, before update) {
    for (Toy__c t:Trigger.new){
        if (t.Quantity__c>0){
            t.Availability__c = true;
        }
        else {
        	t.Availability__c = false;    
        }        
    }
}