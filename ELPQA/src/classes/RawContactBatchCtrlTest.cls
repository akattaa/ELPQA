/*
Name        : RawContactBatchCtrlTest
Author      : Umer Aziz
Date        : 11-June-2015
Version     : 1.0
Description:
*/
@isTest
private class RawContactBatchCtrlTest {

    static testMethod void myUnitTest() {
        // TO DO: implement unit test
        RawContactBatchCtrl RCBC = new RawContactBatchCtrl();
        RCBC.RunBatch();
        RCBC.getrecords();
    }
}