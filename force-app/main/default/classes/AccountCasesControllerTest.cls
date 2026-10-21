@IsTest
private class AccountCasesControllerTest {
    @TestSetup
    static void setup() {
        Account testAccount = TestDataFactory.createTestAccount();
        TestDataFactory.createTestCase(testAccount.Id, 'Panne imprimante');
        TestDataFactory.createTestCase(testAccount.Id, 'Question facture');
    }

    @IsTest
    static void testSearchBySubject() {
        Account testAccount = [SELECT Id FROM Account LIMIT 1];

        Test.startTest();
        List<Case> results = AccountCasesController.findCasesBySubject(testAccount.Id, 'imprimante');
        Test.stopTest();

        Assert.areEqual(1, results.size(), 'Should return one case');
        Assert.areEqual('Panne imprimante', results[0].Subject, 'Should return the matching case');
    }
}
