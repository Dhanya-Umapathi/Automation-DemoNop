*** Settings ***
Documentation    Resource files with resuable keywords and variables
Library    SeleniumLibrary

*** Variables ***
${url}    http://admin-demo.nopcommerce.com
${browser}    chrome
${username}    admin@yourstore.com
${pass}    admin
${email_path}    id:Email
${password_path}    id:Password
${login_button_path}    xpath://button[@class='button-1 login-button']

*** Keywords ***

#Open browser
Open the browser with url
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    
#Close Browser
Close the browser
    Close All Browsers

#valid Login
Valid Login
    Input Text    ${email_path}    ${username}
    Input Password    ${password_path}    ${pass}
    Click Button    ${login_button_path}
    Page Should Contain    Dashboard
