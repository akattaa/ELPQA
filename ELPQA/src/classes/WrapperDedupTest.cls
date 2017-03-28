@isTest
private class WrapperDedupTest {

   /* Methods for testing */
   
   static testMethod void myTest() {
   
   
     //  ClientID__c clid = DataFactoryUtilTest.AddClientId2('testfname', 'testlname', 'test@test.com','test@test.com', 'st', 'st', 'st','st' ,'state','country','232323', 1, 100);
       
       test.startTest();
       
       ClientID__c clid = new ClientID__c();
       
       insert clid;

        ClientID__c client= [SELECT Id FROM ClientID__c WHERE Id = :clid.Id];

       
      // WrapperDedup w = DataFactoryUtilTest.AddWrapper(client);
       
        test.stopTest();
        
              
       
       integer i = [Select Count() from ClientID__c];
       System.AssertEquals(i,1);
   }
   
   

}