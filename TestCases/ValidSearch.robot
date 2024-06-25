*** Settings ***
Documentation    Search customerpage used to search the customer
Library    SeleniumLibrary
Resource    ../Resources/CustomerSearchResources.robot
Resource    ../Resources/GenericResources.robot
Library    DataDriver    file=../TestData/SearchCustomer.xlsx    sheet_name=Valid search
Test Setup    Open the browser with url
Test Teardown    Close the browser

*** Test Cases ***
Customersearch
    [Template]    Search Customer 
    ${emailcus}    ${fname}    ${lname}    ${company_name}


*** Keywords ***
Search Customer
    [Arguments]    ${emailsearch}    ${fname}    ${lname}    ${company_name}
    Valid Login
    Click on customer element
    Click on firtmenu customer
    #Run Keyword If    '${emailsearch}'!=''    Input for customer search    ${emailsearch}    ${fname}    ${lname}    ${company_name}
    Input for customer search    ${emailsearch}    ${fname}    ${lname}    ${company_name}
    Click on search button
    Assert for records available   

