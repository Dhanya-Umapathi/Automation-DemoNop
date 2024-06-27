*** Settings ***
Documentation    Edit details operations is done in file 
Library    SeleniumLibrary
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/CustomerSearchResources.robot
Resource    ../Resources/EditDetailsResources.robot
Test Setup    Open the browser with url
Test Teardown    Close the browser

*** Test Cases ***
Testcase for back page
    Back Page

Testcase for save-continue button
    Save and continue edit

Testcase for delete button
    Delete button
*** Keywords ***
Back Page
    Valid Login
    Click on customer element
    Click on firtmenu customer
    Click on edit button
    Verify edit button navigates to edit page
    Click on back to page
    Assert main page is navigated

Save and continue edit
    Valid Login
    Click on customer element
    Click on firtmenu customer
    Click on edit button
    Verify edit button navigates to edit page
    Click on save-continue button
    Assert edit is successfull

Delete button
    Valid Login
    Click on customer element
    Click on firtmenu customer
    Click on edit button
    Verify edit button navigates to edit page
    Click on delete button
    Click on yes delete button
