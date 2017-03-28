<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Update_Auto_Response_Message_Contact</fullName>
        <description>Update the text of the template message for Contacts.</description>
        <field>Auto_Response_Message_Contact__c</field>
        <formula>Auto_Response_Template_Contact__r.Body__c</formula>
        <name>Update Auto Response Message Contact</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Auto_Response_Message_Lead</fullName>
        <field>Auto_Response_Message_Lead__c</field>
        <formula>Auto_Response_Template_Lead__r.Body__c</formula>
        <name>Update Auto Response Message Lead</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Update Template Message Contact</fullName>
        <actions>
            <name>Update_Auto_Response_Message_Contact</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Update the text of the template message for Contacts.</description>
        <formula>OR(      ISNEW()   ,ISCHANGED( Auto_Response_Template_Contact__c ) )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update Template Message Lead</fullName>
        <actions>
            <name>Update_Auto_Response_Message_Lead</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Update the text of the template message for Leads.</description>
        <formula>OR(      ISNEW()    ,ISCHANGED( Auto_Response_Template_Lead__c ) )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
