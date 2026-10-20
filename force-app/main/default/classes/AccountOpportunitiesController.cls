public with sharing class AccountOpportunitiesController {
    @AuraEnabled(Cacheable=true)
    public static List<Opportunity> getOpportunitiesByAccountIdAndName(Id accountId, String searchNameOpp) {
        return OpportunitySelector.getOpportunitiesByAccountIdAndName(accountId);
    }
}