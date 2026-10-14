public with sharing class AccountCasesController {

    @AuraEnabled 
    public static List<Case> findCasesBySubject(Id accountId, String subjectSearchTerm){
        String searchPattern = '%' + subjectSearchTerm + '%';
        return [
            SELECT Id, Subject, Status, Priority, AccountId 
            FROM Case
            WHERE AccountId=:accountId
            AND Subject like : searchPattern
            WITH USER_MODE
            ORDER BY Id
        ];

    }


}