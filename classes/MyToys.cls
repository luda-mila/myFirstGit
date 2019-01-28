public class MyToys {
    //public List <Toy__c> editdel {get; set;}
    public String SearchToyName {get; set;}
    public Integer noOfRecords{get; set;}
    public Integer size{get;set;}
    //public String soqlsort {get; set;}
   // public List<Toy__c> results {get; set;}
       // public Toy__c t {get; set;}
           //Public List <Toy__c> Game1 {get; set;}
    
    
   // public Toy__c deletet {get; set;}
    //public Toy__c delToy = new Toy__c();
    public List<Toy__c> Toys { get {
    	return (List<Toy__c>)setCon.getRecords(); 
    } set; }
   

	public ApexPages.StandardSetController setCon {
		get{
			if(setCon == null){
				size = 5;  
                String results = 'SELECT Id, Name, Image_Toy__c, Price__c, Quantity__c, Availability__c, Added_Date__c, Release_Date__c, Type__c FROM Toy__c WHERE Name LIKE \'%'+(SearchToyName ==NULL ? '' : SearchToyName)+ '%\'';
    			setCon = new ApexPages.StandardSetController(Database.getQueryLocator(results));
				setCon.setPageSize(size);                
				noOfRecords = setCon.getResultSize();
			}            
			return setCon;
		}set;
	}
    public void SearchToys(){
        setCon = NULL;
        setCon.setPageNumber(1);
    }
      /* public void toggleSort() {
        // simply toggle the direction
        sortDir = sortDir.equals('asc') ? 'desc' : 'asc';

                                // run the query again for sorting other columns
                                soqlsort = 'SELECT Id, Name, Image_Toy__c, Price__c, Quantity__c, Availability__c, Added_Date__c, Release_Date__c, Type__c FROM Toy__c'; 

                                // Adding String array to a List array
                                Game = Database.query(soqlsort + ' order by ' + sortField + ' ' + sortDir ); 

                                // Adding Caselist to Standard Pagination controller variable
                                setCon = new ApexPages.StandardSetController(Game);

                                // Set Page Size to 10
                                setCon.setPageSize(5);

    }

    // the current sort direction. defaults to asc
    public String sortDir {
        // To set a Direction either in ascending order or descending order.
                                get  { if (sortDir == null) {  sortDir = 'asc';} return sortDir;}
        set;
    }

    // the current field to sort by. defaults to last name
    public String sortField {
        // To set a Field for sorting.
                                get  { if (sortField == null) {sortField = 'Name'; } return sortField;  }
        set;
    } 

    ///For refresh function button
    public PageReference Refresh() {
    PageReference pageRef = new PageReference(ApexPages.currentPage().getUrl()); 
    pageRef.setRedirect(true); 
    return pageRef;
    }

  
  /*  public string selectedToyId {get; set;}

    public void LoadData() {
        editdel = [SELECT Id, Name, Image_Toy__c, Price__c, Quantity__c, Availability__c, Added_Date__c, Release_Date__c, Type__c FROM Toy__c];
        setCon = new ApexPages.StandardSetController(editdel);
        setCon.SetPageSize(5);
    }

    public void DeleteToy() {
        if(selectedToyId == NULL){
            return;
        }

        //Find account record with in collection
        deletet = NULL;
        for(Toy__c a : editdel)
            if(a.Id == selectedToyId){
                deletet = a;
                //Delete deleteacc;
                break;
            } 

            //If account record found to delete it  
            if(deletet != NULL) {
               Delete deletet; 
            }
        //refresh the dataList
        LoadData();*/
    }