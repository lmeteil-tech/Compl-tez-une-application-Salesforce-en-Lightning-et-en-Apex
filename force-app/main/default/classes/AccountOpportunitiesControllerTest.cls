@IsTest
private class AccountOpportunitiesControllerTest {
    @TestSetup
    static void setup() {
        Account testAccount = TestDataFactory.createTestAccount();
        TestDataFactory.createTestOpportunity(testAccount.Id);
    }

    @IsTest
    static void testGetOpportunities() {
        Account testAccount = [SELECT Id FROM Account LIMIT 1];
        Test.startTest();
        List<Opportunity> results = AccountOpportunitiesController.getOpportunitiesByAccountIdAndName(testAccount.Id, '');
        Test.stopTest();
        Assert.areEqual(1, results.size(), 'Should return one opportunity');
    }

    @IsTest
    static void testGetOpportunitiesNoMatch() {
        Account testAccount = [SELECT Id FROM Account LIMIT 1];
        Test.startTest();
        List<Opportunity> results = AccountOpportunitiesController.getOpportunitiesByAccountIdAndName(testAccount.Id, 'zzz_no_match');
        Test.stopTest();
        Assert.areEqual(0, results.size(), 'Should return no opportunity');
    }
}