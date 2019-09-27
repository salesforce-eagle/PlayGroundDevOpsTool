@isTest
private class UnitTestSuperBedge_VerifyDate_Test {
    @isTest
    private static void method(){
        UnitTestSuperBedge_VerifyDate.CheckDates(
            Date.newInstance(2019, 08, 17), Date.newInstance(2019, 08, 30)                                                
        );
    }
    @isTest
    private static void method1(){
        UnitTestSuperBedge_VerifyDate.CheckDates(
            Date.newInstance(2019, 08, 17), Date.newInstance(2019, 08, 13)                                                
        );
    }
}