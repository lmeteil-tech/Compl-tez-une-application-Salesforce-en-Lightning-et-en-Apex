public with sharing class AccountHandler {
    public static Account  insertNewAccount (String nomCompte) {
        Account a = new Account(Name = nomCompte);
        try {
            insert a;
            return a;
        }
        catch (DmlException e) {
                System.debug('Une exception s\'est produite: '+ e.getMessage());
                return null;                
        }
    }
}