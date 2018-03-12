# PARSE-iOS BOILERPLATE [OBJECTIVE-C]
This is a simple, and hopefully growing, boilerplate for the Parse Objective-C.

## SIMPLE SETUP

First, open the file:

    AppDelegate.m

And replace "APP-ID" & "CLIENT-KEY" in:

    configuration.applicationId = @"APP-ID";
    configuration.clientKey = @"CLIENT-KEY";
    
*in this sample i used back4app.com like service provider but you cant change it too.

If you are using another server change "https://parseapi.back4app.com" in:

    configuration.server = @"https://parseapi.back4app.com";
    
## TEST

Create a Class called: "Test" in your Parse-Server and add a column called "text".

After, add a row and put the "Hello World" text in the column & run the application.

You will see a message on the center of the device screen or simulator
