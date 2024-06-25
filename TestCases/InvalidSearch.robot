*** Settings ***
Documentation    Search customerpage used to search the customer
Library    SeleniumLibrary
Resource    ../Resources/CustomerSearchResources.robot
Resource    ../Resources/GenericResources.robot
Library    DataDriver    file=../TestData/SearchCustomer.xlsx    sheet_name=Invalid Search
Test Setup    Open the browser with url
Test Teardown    Close the browser

*** Test Cases ***
InvalidSearchCustomer
    [Template]    Invalid Search Customer
    ${invalidemail}    ${invalidfname}    ${invalidlname}    ${invalidcompany_name}

*** Keywords ***
Invalid Search Customer
    [Arguments]    ${invalidemailsearch}    ${invalidfname}    ${invalidlname}    ${invalidcompany_name}
    Valid Login
    Click on customer element
    Click on firtmenu customer
    Input for customer search    ${invalidemailsearch}    ${invalidfname}    ${invalidlname}    ${invalidcompany_name}
    Click on search button
    Assert for no records found