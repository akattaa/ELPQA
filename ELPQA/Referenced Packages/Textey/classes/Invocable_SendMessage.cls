/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class Invocable_SendMessage {
    global Invocable_SendMessage() {

    }
    @InvocableMethod(label='Send Textey Message')
    global static void sendMessage(List<simplesms.Invocable_SendMessage.SendMessageRequest> requests) {

    }
global class SendMessageRequest {
    @InvocableVariable(label='From Phone' required=true)
    global String fromNumber;
    @InvocableVariable(label='Message' required=false)
    global String message;
    @InvocableVariable(label='Owner Id' required=true)
    global String ownerId;
    @InvocableVariable(label='1. Additional Parent Field Name' required=false)
    global List<String> parentFields;
    @InvocableVariable(label='Parent Id' required=true)
    global String parentId;
    @InvocableVariable(label='2. Additional Parent Id' required=false)
    global List<String> parentValues;
    @InvocableVariable(label='Template Code' required=false)
    global String templateCode;
    @InvocableVariable(label='TimeZone Id' required=false)
    global String timeZoneId;
    @InvocableVariable(label='To Phone' required=true)
    global String toNumber;
    global SendMessageRequest() {

    }
}
}
