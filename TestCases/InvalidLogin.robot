*** Settings ***
Documentation    Login file to verify login details 
Library    SeleniumLibrary
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/LoginResources.robot
Library    DataDriver    file=../TestData/Invalidlogin.xlsx    sheet_name=Invalid data
Test Setup    Open the browser with url
Test Teardown    Close the browser

*** Test Cases ***
Invalidlogin   
    [Template]    Invalid Login
    ${email}    ${password} 

*** Keywords ***
Invalid Login
    [Arguments]    ${email}    ${password}
    Input email    ${email}
    Input Pwd    ${password}
    Click checkbox in login page
    Click login button
    Run Keyword If    '${email}' == ''    Blank email message
    ...    ELSE    Error message for invalid login
