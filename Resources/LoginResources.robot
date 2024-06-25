*** Settings ***
Documentation    Login Resource file uses all login functionalitiy
Library    SeleniumLibrary

*** Variables ***
${email_path}    id:Email
${password_path}    id:Password
${login_button_path}    xpath://button[@class='button-1 login-button']
${checkbox_path}    id:RememberMe
${blank_email_path}    id:Email-error

*** Keywords ***
Input email
    [Arguments]    ${email}
    Input Text    ${email_path}    ${email}

Input pwd
    [Arguments]    ${password}
    Input Password    ${password_path}    ${password}

Click login button
    Click Button    ${login_button_path}

Click checkbox in login page
    Select Checkbox    ${checkbox_path}

Error message for invalid login
    Page Should Contain    Login was unsuccessful.

Success message for valid login
    Page Should Contain    Dashboard

Blank email message
    Element Should Be Visible    ${blank_email_path}    Please enter your email