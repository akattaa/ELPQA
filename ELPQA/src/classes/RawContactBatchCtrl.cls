/*
Name        : RawContactBatchCtrl
Author      : Umer Aziz
Date        : 11-June-2015
Version     : 1.0
Description:
*/
public without sharing class RawContactBatchCtrl{
    
    public ID batchId {get; set;}
    public string currentStatus {get; set;}
    
    
    public RawContactBatchCtrl(){
        batchId = ApexPages.currentPage().getParameters().get('Id');
    }
    public void RunBatch(){
        if (batchId == null) {
            RawContactDeDupBatch c = new RawContactDeDupBatch('Raw Contact');
            batchId = database.executebatch(c, 100);
        } else {            
            getrecords();
            batchId = null;
        }
            
    }
    public void getrecords(){
        Integer ProcessedBatch = 0;
        Integer TotalBatch = 0;
        String processStatus;
        List<AsyncApexJob> results = [SELECT Id, Status, NumberOfErrors, JobItemsProcessed, TotalJobItems, CreatedBy.Email
                                                                FROM AsyncApexJob WHERE Id = :batchId];
        
        for (AsyncApexJob aj : results){
                ProcessedBatch = Integer.valueOf(aj.get('JobItemsProcessed'));
                TotalBatch = Integer.valueOf(aj.get('TotalJobItems'));
                        
                if (processStatus != aj.get('Status')+'') {
                        processStatus = aj.get('Status')+'';
                        currentStatus = processStatus;
                }
        }
    }
}