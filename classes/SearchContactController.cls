public with sharing class SearchContactController
{

    public SearchContactController(ApexPages.StandardController con) { }
    public List<Contact> results { get; set; }
    public String name { get; set; }

    public SearchContactController()
    {
        results = new List<Contact>();
    }

    public PageReference SearchByName()
    {
        results = [SELECT Id ,FirstName, LastName, Email, Account.Id, Account.Name, MobilePhone, CreatedDate 
                    FROM Contact WHERE (FirstName = :name OR LastName = :name OR Name = :name)];
        return null;
    }
    
    public List<Contact> getContacts() {
        List<Contact> contacts =  [ SELECT Id, FirstName, LastName, Email , Account.Id, Account.Name, MobilePhone, CreatedDate
                                        FROM Contact WHERE Account.Id!=null LIMIT 20];
        return contacts;
    }

}
//работа с фильтром