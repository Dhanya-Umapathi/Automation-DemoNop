*** Settings ***
Documentation    Edit file is update the data in file 
Library    SeleniumLibrary
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/CustomerSearchResources.robot
Resource    ../Resources/EditDetailsResources.robot
Library    DataDriver    ../TestData/EditCustomerDetails.csv
Test Setup    Open the browser with url
Test Teardown    Close the browser

*** Test Cases ***
Edit details in customer page
    [Template]    Edit Details
    ${editemail}    ${password}    ${fname}    ${lname}    ${gender}    ${dob}    ${company_name}    ${tax}    ${manager_of_vendor}    ${active}    ${admin_content}

*** Keywords ***
Edit Details
    [Arguments]    ${editemail}    ${password}    ${fname}    ${lname}    ${gender}    ${dob}    ${company_name}    ${tax}    ${manager_of_vendor}    ${active}    ${admin_content}
    Valid Login
    Click on customer element
    Click on firtmenu customer
    Click on edit button
    Verify edit button navigates to edit page
    Edit inforamtion provided    ${editemail}    ${password}    ${fname}    ${lname}    ${gender}    ${dob}    ${company_name}    ${tax}    ${manager_of_vendor}    ${active}    ${admin_content}
    Click on save button
    Assert edit is successfull