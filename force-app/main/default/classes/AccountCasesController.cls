public with sharing class AccountCasesController {

    @AuraEnabled 
    public static void findCasesBySubject(){
        return [
            SELECT Id, Subject, Status, Priority, AccountId 
            FROM Case
            WITH USER_MODE
            ORDER BY Id
        ];

    }


}