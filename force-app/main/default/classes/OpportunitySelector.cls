public with sharing class OpportunitySelector {
    public static List<Opportunity> getOpportunitiesByAccountId(Id accountId) {
        return [SELECT Id, Name, Amount, CloseDate, StageName FROM Opportunity WHERE AccountId = :accountId];
    }

        // seconde méthode : filtre sur le nom pour le controller
    public static List<Opportunity> getOpportunitiesByAccountIdAndName(Id accountId, String searchNameOpp) {
        String likeTerm = '%' + (String.isBlank(searchNameOpp) ? '' : searchNameOpp.trim()) + '%';
        return [
            SELECT Id, Name, Amount, CloseDate, StageName
            FROM Opportunity
            WHERE AccountId = :accountId
            AND Name LIKE :likeTerm
            WITH USER_MODE
            ORDER BY CloseDate DESC
        ];
    }
}