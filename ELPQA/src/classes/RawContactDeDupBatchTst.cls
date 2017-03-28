/*
Name        : RawContactDeDupBatchTst
Author      : Umer Aziz
Date        : 30-July-2015
Version     : 1.0
Description:
*/
@isTest
public class RawContactDeDupBatchTst
{

    static testMethod void Method1(){ 
        //DeDupUtil objDeDupUtil = new DeDupUtil('Contact');
        //DeDupUtil objDeDupUtil2 = new DeDupUtil();
        ClientIDUtil objClientIDUtil = new ClientIDUtil();
        
        /**************************************************************
        ****************Code Coverage ReservationTest  ***************
        **************************************************************/
        Amenities__c am = DataFactoryUtilTest.Amenities();
        insert am;
        
        Robot_Amenities_Detail__c RAD = DataFactoryUtilTest.Robot_Amenities_Detail(am);
        insert RAD;
        
        Robot_Amenities_Detail__c RAD2 = DataFactoryUtilTest.Robot_Amenities_Detail(am);
        RAD2.Robot_ID__c  = 'Test Robot 2';
        RAD2.Name = 'Shereton';
        insert RAD2;
        
        Property__c       MyProperty2 = DataFactoryUtilTest.AddProperty();
        MyProperty2.Property_ID__c = 'Testing Property'+3;
        Insert MyProperty2;
        
        Site__c           MySite = DataFactoryUtilTest.AddSite(Myproperty2);
        MySite.Site_ID__c = 'Test Site'+1;
        Insert MySite;
        
        Unit__c           MyUnit = DataFactoryUtilTest.AddUnit(Myproperty2,MySite);
        Insert MyUnit;
        
        Sources__c        MySource  = DataFactoryUtilTest.AddSource();
        insert MySource;
               
        Contact           MyContact = DataFactoryUtilTest.AddContact();
        Insert MyContact;
    
        ClientID__c       MyClient    = DataFactoryUtilTest.AddCClientId(MyContact);
        insert MyClient;
        
        Raw_Contact__c RawEnt1 =  DataFactoryUtilTest.AddRawContact();
        RawEnt1.Is_Processed__c = false;
        insert RawEnt1; 
        
        Membership__c  MyMembership = DataFactoryUtilTest.AddMembership(MyClient, MySource);
        MyMembership.CoApplicant_Email_Address__c = 'member@member.com';
        insert MyMembership;
        
        /*************************************************************************/
        /****************************Top Amenities Batch Test*********************/
        Top_Amenity__c TAM = DataFactoryUtilTest.AddTopAmenity(MyContact);
        insert TAM;
        
        //TopAmenitiesBat TM =  new TopAmenitiesBat();
        //Database.executeBatch(TM);

        /*************************************************************************/

        List <Contact> lstContacttoInsert = new List<Contact>();
        Contact cont = DataFactoryUtilTest.AddContact();
        //lstContacttoInsert.add(cont) ;
        
        Contact cont2 = DataFactoryUtilTest.AddContact();
            cont2.FirstName = 'Test2 First Name';
            cont2.LastName ='Test2 Last Name';
            cont2.contact_Id__c = 'con '+22;
            cont2.email = 'test2@g.com';
            cont2.MailingStreet = 'Test2 Address'; //
            cont2.MailingCity = 'Test2 City';
            cont2.MailingState = 'Test2 State';
            cont2.MailingPostalCode = '123456';
            cont2.MailingCountry = 'US2';
            cont2.Phone ='1234567';
            cont2.add_date__c = date.today()-1;
        //lstContacttoInsert.add(cont2) ;
        
        Contact cont3 = DataFactoryUtilTest.AddContact();
            cont3.FirstName = 'Test3 First Name';
            cont3.LastName ='Test3 First Name';
            cont3.contact_Id__c = 'con '+33;
            cont3.Email = 'test22@g.com';
            cont3.Email_2__c = 'test11@g.com';
            cont3.OtherStreet = 'Test3 other Address'; //
            cont3.OtherCity = 'Test3 other City';
            cont3.OtherState = 'Test3 other State';
            cont3.OtherPostalCode = '123456';
            cont3.OtherCountry = 'other country3';
            cont3.OtherPhone ='1234567';
            cont3.RVOTGPROFILE__c = 'Y';
            cont3.New_Add_Date__c = date.today()-2;
            //cont3.add_date__c = date.today()-1;
        lstContacttoInsert.add(cont3) ;         
        
        Contact cont4 = DataFactoryUtilTest.AddContact();
            cont4.FirstName = 'Test4 First Name';
            cont4.LastName ='Test4 First Name';
            cont4.contact_Id__c = 'con '+44;
            cont4.Email = 'test44@g.com';
            cont4.Email_2__c = 'test4@g.com';
            //cont4.MailingAddress = 'Test4 Address'; 
            cont4.MailingStreet = 'Test4 Address'; //
            cont4.MailingCity = 'Test4 City';
            cont4.MailingState = 'Test4 State';
            cont4.MailingPostalCode = '123456';
            cont4.MailingCountry = 'US4';
            cont4.Phone = '123456';
            cont4.OtherStreet = 'Test34 other Address'; //
            cont4.OtherCity = 'Test34 other City';
            cont4.OtherState = 'Test34 other State';
            cont4.OtherPostalCode = '1234564';
            cont4.OtherCountry = 'other country34';
            cont4.OtherPhone ='12345674';
            cont4.New_Add_Date__c = date.today()-2;
            //cont4.add_date__c = date.today()-1;
        lstContacttoInsert.add(cont4) ; 
        
        insert lstContacttoInsert;

        ELS_Product__c  ElsProd = DataFactoryUtilTest.AddElsProduct(MyClient,MySource);
        insert ElsProd ;
        
        //Email
        ELS_Product__c  ElsProd1 = DataFactoryUtilTest.AddElsProduct(MyClient,MySource);//DataFactoryUtilTest.AddElsProduct2(MyClient);
            ElsProd1.RCG_Number__c = 'RCG 3';
            ElsProd1.Co_Applicant_First_Name__c ='Test';
            ElsProd1.Co_Applicant_Last_Name__c ='Record';
            ElsProd1.Co_Applicant_Email__c = 'test@g.com';
            ElsProd1.Co_Applicant_Address_1__c = 'Test Address';
            ElsProd1.Co_Applicant_Address_2__c = 'Test Address 2';
            ElsProd1.Co_Applicant_State__c = 'Test State';
            ElsProd1.Co_Applicant_Zip_Code__c = '123456';
            ElsProd1.Co_Applicant_Phone__c='1234567';
            ELSProd1.Source_ID__c =  'RCG1' ;
        insert ElsProd1 ;

        //FLAS
        ELS_Product__c  ElsProd3 = DataFactoryUtilTest.AddElsProduct(MyClient,MySource);//DataFactoryUtilTest.AddElsProduct2(MyClient);
            ElsProd3.RCG_Number__c = 'RCG 4';
            ElsProd3.Co_Applicant_First_Name__c ='Test';
            ElsProd3.Co_Applicant_Last_Name__c ='Record';
            ElsProd3.Co_Applicant_Email__c = 'test1@g.com';
            ElsProd3.Co_Applicant_Address_1__c = 'Test Address';
            ElsProd3.Co_Applicant_Address_2__c = 'Test Address 2';
            ElsProd3.Co_Applicant_State__c = 'Test State';
            ElsProd3.Co_Applicant_Zip_Code__c = '123456';
            ElsProd3.Co_Applicant_Phone__c='1234567';
            ELSProd3.Source_ID__c =  'RCG2' ;
        insert ElsProd3 ;

        //LAZ
        ELS_Product__c  ElsProd2 = DataFactoryUtilTest.AddElsProduct(MyClient,MySource);//DataFactoryUtilTest.AddElsProduct2(MyClient);
            ElsProd2.RCG_Number__c = 'RCG 5';
            ElsProd2.Co_Applicant_First_Name__c ='1Test';
            ElsProd2.Co_Applicant_Last_Name__c ='Record';
            ElsProd2.Co_Applicant_Email__c = 'test2@g.com';
            ElsProd2.Co_Applicant_Address_1__c = 'Test Address';
            ElsProd2.Co_Applicant_Address_2__c = 'Test Address 2';
            ElsProd2.Co_Applicant_State__c = 'Test State';
            ElsProd2.Co_Applicant_Zip_Code__c = '123456';
            ElsProd2.Co_Applicant_Phone__c='1234567';
            ELSProd2.Source_ID__c =  'RCG3' ;
        insert ElsProd2 ;

        //PF
        ELS_Product__c  ElsProd4 = DataFactoryUtilTest.AddElsProduct(MyClient,MySource);//DataFactoryUtilTest.AddElsProduct2(MyClient);
            ElsProd4.RCG_Number__c = 'RCG 6';
            ElsProd4.Co_Applicant_First_Name__c ='Test';
            ElsProd4.Co_Applicant_Last_Name__c ='1Record';
            ElsProd4.Co_Applicant_Email__c = 'test3@g.com';
            ElsProd4.Co_Applicant_Address_1__c = 'Test Address';
            ElsProd4.Co_Applicant_Address_2__c = 'Test Address 2';
            ElsProd4.Co_Applicant_State__c = 'Test State';
            ElsProd4.Co_Applicant_Zip_Code__c = '123456';
            ElsProd4.Co_Applicant_Phone__c='1234567';
            ELSProd4.Source_ID__c =  'RCG4' ;
        insert ElsProd4 ;

        //PL
        ELS_Product__c  ElsProd5 = DataFactoryUtilTest.AddElsProduct(MyClient,MySource);//DataFactoryUtilTest.AddElsProduct2(MyClient);
            ElsProd5.RCG_Number__c = 'RCG 7';
            ElsProd5.Co_Applicant_First_Name__c ='3Test';
            ElsProd5.Co_Applicant_Last_Name__c ='Record';
            ElsProd5.Co_Applicant_Email__c = 'test22@g.com';
            ElsProd5.Co_Applicant_Address_1__c = 'Test Address';
            ElsProd5.Co_Applicant_Address_2__c = 'Test Address 2';
            ElsProd5.Co_Applicant_State__c = 'Test State';
            ElsProd5.Co_Applicant_Zip_Code__c = '11234567';
            ElsProd5.Co_Applicant_Phone__c='1234567';
            ELSProd5.Source_ID__c =  'RCG5' ;
            ElsProd5.Purchase_Date__c = date.today();
        insert ElsProd5 ;
        /*************************************************************************/
        Raw_Contact__c RawEnt =  DataFactoryUtilTest.AddRawContact();
        RawEnt.Is_Processed__c = false;
        RawEnt.Record_Type__c = 'Mem';
        insert RawEnt;       
        
        Raw_Contact__c RawEnt2 =  DataFactoryUtilTest.AddRawContact();
        RawEnt2.Is_Processed__c = false;
        RawEnt2.Create_Activities_and_Interests__c = true;
        RawEnt2.Record_Type__c = 'Voy';
        insert RawEnt2;
        
        Raw_Contact__c RawEnt3 =  DataFactoryUtilTest.AddRawContact();
        RawEnt3.Is_Processed__c = false;
        RawEnt3.Create_Activities_and_Interests__c = true;
        RawEnt3.Email__c  = 'Rew_contact@Rawcontact.com';
        RawEnt3.Email_2__c = 'Rew_contact2@Rawcontact.com';
        RawEnt3.Record_Type__c = 'Voy';
        insert RawEnt3;
        
        Raw_Contact__c RawEnt4 =  DataFactoryUtilTest.AddRawContact();
        RawEnt4.Is_Processed__c = false;
        RawEnt4.Create_Activities_and_Interests__c = true;
        RawEnt4.Email__c  = 'Rew_contact3@Rawcontact.com';
        RawEnt4.Email_2__c = 'Rew_contact4@Rawcontact.com';
        RawEnt4.Record_Type__c = 'Voy';
        insert RawEnt4; 
        
         /********************************** Parner Sources ***************************************/
         
        Raw_Contact__c partnerRC =  DataFactoryUtilTest.AddRawContact();
        
        partnerRC.Is_Processed__c = false;
        partnerRC.Add_Date__c = Date.today();
        partnerRC.First_Name__c = 'partnerfname';
        partnerRC.Last_Name__c = 'partnerlname';
        
        partnerRC.Email__c  = 'partneremail@Rawcontact.com';
        partnerRC.Phone__c ='1212121212';

        partnerRC.Street_1__c = 'partner 1 Address';
        partnerRC.Street_2__c = '';
        partnerRC.Country_1__c = 'partner  country 1';
        partnerRC.City_1__c = 'partner 1 City';
        partnerRC.State_1__c = 'partner 1 State';
        partnerRC.Zip_1__c = '111111';
         
        partnerRC.Record_Type__c = 'Partner';
       
        insert partnerRC;
       
       Raw_Contact__c partnerRC2 =  DataFactoryUtilTest.AddRawContact();
        partnerRC2.Is_Processed__c = false;
        partnerRC2.Add_Date__c = Date.today() + 1;
        partnerRC2.First_Name__c = 'partnerfname';
        partnerRC2.Last_Name__c = 'partnerlname';
        partnerRC2.Email__c  = 'partneremail2@Rawcontact.com';
        partnerRC2.Phone__c ='1212121212';
        partnerRC2.Street_1__c = 'partner 1 Address';
        partnerRC2.Street_2__c = '';
        partnerRC2.Country_1__c = 'partner  country 1';
        partnerRC2.City_1__c = 'partner 1 City';
        partnerRC2.State_1__c = 'partner 1 State';
        partnerRC2.Zip_1__c = '111111'; 
        partnerRC2.Record_Type__c = 'Partner';
       
        insert partnerRC2;
        
        Raw_Contact__c partnerRC3 =  DataFactoryUtilTest.AddRawContact();    
        partnerRC3.Is_Processed__c = false;
        partnerRC3.Add_Date__c = Date.today() + 3;
        partnerRC3.First_Name__c = 'partnerfname3';
        partnerRC3.Last_Name__c = 'partnerlname';
        partnerRC3.Email__c  = 'partneremail2@Rawcontact.com';
        partnerRC3.Phone__c ='1212121212';
        partnerRC3.Street_1__c = 'partner 2 Address';
        partnerRC3.Street_2__c = '';
        partnerRC3.Country_1__c = 'partner  country 2';
        partnerRC3.City_1__c = 'partner 2 City';
        partnerRC3.State_1__c = 'partner 2 State';
        partnerRC3.Zip_1__c = '22222'; 
        partnerRC3.Record_Type__c = 'Partner';
       
        insert partnerRC3;
        
        Raw_Contact__c partnerRC4 =  DataFactoryUtilTest.AddRawContact();  
          
        partnerRC4.Is_Processed__c = false;
        partnerRC4.Add_Date__c = Date.today() + 4;
        partnerRC4.First_Name__c = 'partnerfname33';
        partnerRC4.Last_Name__c = 'partnerlname';
        partnerRC4.Email__c  = 'partneremail4@Rawcontact.com';
        partnerRC4.Phone__c ='1212121212';
        partnerRC4.Street_1__c = 'partner 2 Address';
        partnerRC4.Street_2__c = '';
        partnerRC4.Country_1__c = 'partner  country 2';
        partnerRC4.City_1__c = 'partner 2 City';
        partnerRC4.State_1__c = 'partner 2 State';
        partnerRC4.Zip_1__c = '22222'; 
        partnerRC4.Record_Type__c = 'Partner';
       
        insert partnerRC4;
        
       /********************************** Survey ***************************************/
         
        Raw_Contact__c surveyRC =  DataFactoryUtilTest.AddRawContact();
        
        surveyRC.Is_Processed__c = false;
        surveyRC.Add_Date__c = Date.today();
        surveyRC.First_Name__c = 'surfname';
        surveyRC.Last_Name__c = 'surlname';
        
        surveyRC.Email__c  = 'sur@Rawcontact.com';
        surveyRC.Phone__c ='144444';

        surveyRC.Street_1__c = 'sur1 Address';
        surveyRC.Street_2__c = '';
        surveyRC.Country_1__c = 'surcountry 1';
        surveyRC.City_1__c = 'surCity';
        surveyRC.State_1__c = 'surState';
        surveyRC.Zip_1__c = '000023';
         
        surveyRC.Record_Type__c = 'Survey';
       
        insert surveyRC;
  
            
        Raw_Contact__c surveyRC1 =  DataFactoryUtilTest.AddRawContact();
        
        surveyRC1.Is_Processed__c = false;
        surveyRC1.Add_Date__c = Date.today() + 1;
        surveyRC1.First_Name__c = 'fsurfname1';
        surveyRC1.Last_Name__c = 'surlname1';
        
        surveyRC1.Email__c  = 'sur@Rawcontact.com';
        surveyRC1.Phone__c ='14444411';

        surveyRC1.Street_1__c = 'sur1 Address';
        surveyRC1.Street_2__c = '';
        surveyRC1.Country_1__c = 'surcountry 1';
        surveyRC1.City_1__c = 'surCity';
        surveyRC1.State_1__c = 'surState';
        surveyRC1.Zip_1__c = '000023';
         
        surveyRC1.Record_Type__c = 'Survey';
       
        insert surveyRC1;
        
        Raw_Contact__c surveyRC2 =  DataFactoryUtilTest.AddRawContact();
        
        surveyRC2.Is_Processed__c = false;
        surveyRC2.Add_Date__c = Date.today() + 1;
        surveyRC2.First_Name__c = 'fsurfname1';
        surveyRC2.Last_Name__c = 'surlname11';
        
        surveyRC2.Email__c  = 'sur1@Rawcontact.com';
        surveyRC2.Phone__c ='32323223';

        surveyRC2.Street_1__c = 'sur1 Address';
        surveyRC2.Street_2__c = '';
        surveyRC2.Country_1__c = 'surcountry 1';
        surveyRC2.City_1__c = 'surCity';
        surveyRC2.State_1__c = 'surState';
        surveyRC2.Zip_1__c = '000023';
         
        surveyRC2.Record_Type__c = 'Survey';
       
        insert surveyRC2;
        
        Raw_Contact__c surveyRC3 =  DataFactoryUtilTest.AddRawContact();
        
        surveyRC3.Is_Processed__c = false;
        surveyRC3.Add_Date__c = Date.today() + 1;
        surveyRC3.First_Name__c = 'sfsurfname1';
        surveyRC3.Last_Name__c = 'surlname11';
        
        surveyRC3.Email__c  = 'sur3@Rawcontact.com';
        surveyRC3.Phone__c ='67676767';

        surveyRC3.Street_1__c = 'sur1 Address';
        surveyRC3.Street_2__c = '';
        surveyRC3.Country_1__c = 'surcountry 1';
        surveyRC3.City_1__c = 'surCity';
        surveyRC3.State_1__c = 'surState';
        surveyRC3.Zip_1__c = '000023';
         
        surveyRC3.Record_Type__c = 'Survey';
       
        insert surveyRC3;
        
        
        
        
        List<ClientID__c> iListClientIDN = new List<ClientID__c>();
            /*iListClientIDN.add(DataFactoryUtilTest.AddClientId2('Test2 First Name','Test4 First Name', 'test_2@g.com', 'test_3@g.com','','','Test3 Address', 'Test3 City','Test3 State','country3','123456',4,3));
            iListClientIDN.add(DataFactoryUtilTest.AddClientId2('Test2 First Name','Test4 First Name', 'test22@g.com', 'test11@g.com','','','Test3 Address', 'Test3 City','Test3 State','country3','123456',4,2));
            *//*PL*/iListClientIDN.add(DataFactoryUtilTest.AddClientId2('Test2 First Name','Test4 First Name', 'test_2@g.com', 'test_3@g.com','','','Test3 Address', 'Test3 City','Test3 State','country3','123456',4,31));
            /*PF*/iListClientIDN.add(DataFactoryUtilTest.AddClientId2('Test4 First Name','Test3 First Name', 'test.1@g.com', 'test_1@g.com','','','Test3 Address', 'Test3 City','Test3 State','country3','123456',3,41));
            /*LAZ*/iListClientIDN.add(DataFactoryUtilTest.AddClientId2('Test5 First Name','Test4 First Name', 'test5@g.com', 'test22@g.com','Test4 Address','','Test5 Address', 'Test5 City','Test5 State','country5','12345675',2,51));
            /*FLAZ*/iListClientIDN.add(DataFactoryUtilTest.AddClientId2('Test3 First Name','Test3 First Name', 'test44@g.com', 'test6@g.com','','','Test3 Address', 'Test3 City','Test3 State','country3','12345673',0,61));
            /*Email*/iListClientIDN.add(DataFactoryUtilTest.AddClientId2('Test4 First Name','Test4 First Name', 'test7@g.com', 'test61@g.com','Test4 Address','','Test4 Address', 'Test4 City','Test4 State','Country 4','12345673',1,71));               
        insert iListClientIDN ;
        
        List<ClientID__c> iListClientIDN2 = new List<ClientID__c>();
            iListClientIDN2.add(DataFactoryUtilTest.AddClientId2('Harvey','Spector', 'harvey@gmail.com', '', 'Pearson Towers', 'Downtown', 'Test3 Street 1', 'New York City', 'New York State', 'Test Country 1', '22222',1,8));
            iListClientIDN2.add(DataFactoryUtilTest.AddClientId2('Harvey','Spector', 'harvey@gmail.com', '', 'Highend Plaza', '',          'Test2 Street',   'New York City', 'New York State', 'Test Country 2', '22222',2,9));
            iListClientIDN2.add(DataFactoryUtilTest.AddClientId2('Harvey','Spector', 'spector@gmail.com','', 'Pearson Towers', 'Downtown', 'Test3 Street 1', 'New York City', 'New York State', 'Test Country 3', '22222',3,10));
            iListClientIDN2.add(DataFactoryUtilTest.AddClientId2('H',     'Spector', 'hs@gmail.com',     '', 'Pearson Towers', 'Downtown', 'Test3 Street 1', 'New York City', 'New York State', 'Test Country 4', '33333',4,11));
            iListClientIDN2.add(DataFactoryUtilTest.AddClientId2('Monty And Linda','Hughes', 'house97048@hotmail.com','', 'Po Box 742',  '', '', 'Rainier',  'OR', '', '5035562821',1,12));
            iListClientIDN2.add(DataFactoryUtilTest.AddClientId2('Monty And Linda','Hughes', 'house97050@hotmail.com','', 'Po Box 7423', '', '', 'Rainier2', 'OR', '', '5035562822',1,13));
            iListClientIDN2.add(DataFactoryUtilTest.AddClientId2('Monty And Linda','Hughes', 'house97050@hotmail.com','', 'Po Box 742',  '', '', 'Rainier2', 'OR', '', '5035562821',2,14));
            iListClientIDN2.add(DataFactoryUtilTest.AddClientId2('Monty And Linda','Hughes', 'house97051@hotmal.com', '', 'Po Box 7',    '', '', 'Rainier2', 'OR', '', '5035562830',2,15));
            iListClientIDN2.add(DataFactoryUtilTest.AddClientId2('Monty And Linda A','Hughes', 'house97052@hotmal.com', '', 'Po Box 7',    '', '', 'Rainier2', 'OR', '', '5035562830',2,16));
            iListClientIDN2.add(DataFactoryUtilTest.AddClientId2('Monty And Linda A','Hughes A', 'house97053@hotmal.com', '', 'Po Box 8',    '', '', 'Rainier2', 'OR', '', '5035562830',2,17));
            iListClientIDN2.add(DataFactoryUtilTest.AddClientId2('Monty And Linda','Hughes A', 'house97054@hotmal.com', '', 'Po Box 9',    '', '', 'Rainier2', 'OR', '', '5035562830',2,18));
        insert iListClientIDN2 ;
  
        RawContactDeDupBatch CIDB = new RawContactDeDupBatch('RawContact');
        database.executebatch(CIDB);
        
    }
}