/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class BatchRetrieveMessagesFromTwilio implements Database.AllowsCallouts, Database.Batchable<simplesms__SMS_Message__c>, Database.Stateful {
    global Integer totalFailedInserts;
    global Integer totalInserts;
    global Integer totalMessages;
    global void execute(Database.BatchableContext bc, List<simplesms__SMS_Message__c> scope) {

    }
    global void finish(Database.BatchableContext bc) {

    }
    global System.Iterable start(Database.BatchableContext bc) {
        return null;
    }
}
