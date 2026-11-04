public with sharing class ContactAndLeadSearch {
    public static List<List< sObject>> searchContactsAndLeads(String termeSearch) {
        List<List< sObject>> findContactsLeads = 
                        [FIND :termeSearch IN NAME FIELDS RETURNING Contact(LastName,FirstName),Lead(LastName,FirstName)];
                          
                        return findContactsLeads;
    }
}