<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>EmailSMSMessageOwnerofNewMessage</fullName>
        <description>Email SMS Message Owner of New Message</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Simple_SMS/NewSMSMessage</template>
    </alerts>
    <fieldUpdates>
        <fullName>Update_From_Phone</fullName>
        <field>From_Phone__c</field>
        <formula>IF(
    LEN(From_Num__c) = 5
   ,From_Num__c
   ,RIGHT(From_Num__c, 10)
)</formula>
        <name>Update From Phone</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_To_Phone</fullName>
        <description>Update the To Phone field.</description>
        <field>To_Phone__c</field>
        <formula>IF(
    LEN(To__c) = 5
   ,To__c
   ,RIGHT(
      SUBSTITUTE( 
         SUBSTITUTE(
             SUBSTITUTE( 
                 SUBSTITUTE(
                     To__c 
                    ,&quot;-&quot;
                    ,&quot;&quot;
                 )
                 ,&quot;(&quot;
                 ,&quot;&quot;
             )
            ,&quot;)&quot;
            ,&quot;&quot;
          )
         ,&quot; &quot;
         ,&quot;&quot;
       )
      ,10
)
)</formula>
        <name>Update To Phone</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Email Owner When SMS Message Received</fullName>
        <actions>
            <name>EmailSMSMessageOwnerofNewMessage</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>SMS_Message__c.Message__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>SMS_Message__c.Type__c</field>
            <operation>equals</operation>
            <value>Incoming</value>
        </criteriaItems>
        <description>Emails the owner of the SMS Message when a new message is received.</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Populate From Phone Field</fullName>
        <actions>
            <name>Update_From_Phone</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>SMS_Message__c.From_Num__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Populate the From phone field.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Populate To Phone Field</fullName>
        <actions>
            <name>Update_To_Phone</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>SMS_Message__c.To__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Populate the To phone field.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
