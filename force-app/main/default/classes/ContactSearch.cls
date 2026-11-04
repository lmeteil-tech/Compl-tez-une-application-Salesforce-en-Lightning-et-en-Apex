public with sharing class ContactSearch {
    public static List<Contact> searchForContacts(String nomContact, String codPostalContact) {
        List<Contact> findContact= [SELECT Id, Name
        FROM Contact
        WHERE (LastName=:nomContact AND MailingPostalCode=:codPostalContact)
        ] ;
        return findContact;
    }
}