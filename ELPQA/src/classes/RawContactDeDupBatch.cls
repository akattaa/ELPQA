/*
Name        : RawContactDeDupBatch 
Author      : Mahwish Iqbal
Date        : 11-June-2015
Version     : 1.0
Description: This batch is used to perform deduplication on RawContact records
*/
global class RawContactDeDupBatch implements Database.Batchable<sObject>{

    string iObject; // Refresence to get batch constructor value
    
    String  iQuery = 'select id, First_Name__c, Last_Name__c,  Email__c, FLAS__c, LAZ__c, PF__c, PL__c, ' + 
                        'Phone__c,  Add_Date__c, City_1__c, Country_1__c, State_1__c, ' +
                        'Street_1__c,Street_2__c, Zip_1__c,  Source__c, Is_Processed__c, ' +
                        'Campus_A_Profile__c , Record_Type__c, SF_Record_ID__c, IP_Address__c, ' + 
                        'Vendor_Subgroup__c, Vendor_Name__c, Subid__c, Create_Activities_and_Interests__c, ' + 
                        'Type__c, Best_Time_to_Contact__c, File_From__c, Group_Name__c, ' +
                        'Host__c, Location__c, Web_Source__c, Web_Form_Description__c, ' +
                        'Comments__c, Filter_Arrival__c, Filter_Departure__c,Is_From_Silverpop__c, Need_Kitchen__c, ' + 
                        'Need_Meeting_Hall__c, Number_of_RVS__c, Payment_Method__c, Preferred_Hookups__c, ' + 
                        'Marketing_Code__c, How_Did_You_Hear_About_Us__c, Resort_Interested__c, Guest_Number__c, Account_Name__c, Age__c, Gender__c,  ' +
        				'Country_3__c,General_Opt_In__c,Canada_Opt_In__c,State_3__c,French_Canadian_Opt_In__c,SMS_Opt_In__c '+
                        'From Raw_Contact__c where Is_Processed__c = false and IsError__c = false ' +
                        'ORDER BY Add_Date__c ASC';
    
    
    // Batch Constructor
    global RawContactDeDupBatch(string pObj){
        
        iObject = pObj;    
    }
       
    // Start Method
    global Database.QueryLocator start(Database.BatchableContext BC){
        return Database.getQueryLocator(iQuery);
    }
      
    // Execute Logic
    global void execute(Database.BatchableContext BC, List<Raw_Contact__c> scope){
        
        DeDupUtil DeDup  = new DeDupUtil(iObject); 
        MembershipUtil mem = new MembershipUtil();
        ReservationUtil  rev  = new ReservationUtil();
        ProductUtil Pro = new ProductUtil();
        ActivitiesAndInterestsUtil  ActInterests = new ActivitiesAndInterestsUtil();
        PartnerSourcesUtil PartnerSrc= new PartnerSourcesUtil();
        SurveyUtil sur = new SurveyUtil();
        LeadUtils lead = new LeadUtils();
        
        List<WrapperDedup> iListWrapperDedup = new List<WrapperDedup>();
       
        if(scope.size() > 0){ 

            iListWrapperDedup  =  Dedup.GetRawContacts(scope); // Convert RawContact values into wrapper type
            
            DeDup.MatchDeDupCriteria(iListWrapperDedup); // call deduplication method to populate sets of flas , laz, email, pf and pl
            DeDup.CheckDuplicates(iListWrapperDedup); // Perform deduplication on records
            
            rev.getResContacts(iListWrapperDedup, DeDup); // Set refrence of contacts in reservation
            mem.getMemContacts(iListWrapperDedup, DeDup); // Create Co-Applicant from membership contacts
            Pro.getRCGContacts(iListWrapperDedup, DeDup); // Create Co-Applicant from RCG contacts
            ActInterests.getActInterestsContacts(scope, DeDup); // Create activity of contact
            PartnerSrc.getPartnerSourcesContacts(scope, DeDup); // Create partner source of contact
            sur.getSurveyContacts(iListWrapperDedup, DeDup); // Set contact refrence in survey
            lead.getSilverPopContacts(iListWrapperDedup, DeDup); 
            
            
            // Mark all batch records as processed
            for(Raw_Contact__c rawCon : scope){
                rawCon.Is_Processed__c  = true;
            }       
            update scope;  
        }     
   }
     
   global void finish(Database.BatchableContext BC){
       
   }
}