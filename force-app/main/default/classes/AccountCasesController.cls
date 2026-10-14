public with sharing class AccountCasesController {

    @AuraEnabled 
    public static List<Case> findCasesBySubject(){
        return [
            SELECT Id, Subject, Status, Priority, AccountId 
            FROM Case
            WITH USER_MODE
            ORDER BY Id
        ];

    }


}