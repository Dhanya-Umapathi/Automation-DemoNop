*** Settings ***
Documentation    Customer search resource page contains reusable variables and keywords
Library    SeleniumLibrary
Library    ../Python Library/EmailGenerator.py


*** Variables ***
${customer_path}    xpath://p[normalize-space()='Customers']//i[contains(@class,'right fas fa-angle-left')]
${customer1_path}    xpath://a[@href='/Admin/Customer/List']/p
${emailinput_path}    xpath://input[@id='SearchEmail']
${firstname_path}    id:SearchFirstName
${lastname_path}    id:SearchLastName
${company_name_path}    id:SearchCompany
${search_path}    id:search-customers
${records_found_path}    xpath://table[@id='customers-grid']/tbody/tr
${error_message_path}    xpath://table[@id='customers-grid']/tbody/tr/td
*** Keywords ***
Click on customer element
    Wait Until Element Is Visible    ${customer_path}    5s
    Click Element    ${customer_path}

Click on firtmenu customer
    Wait Until Element Is Visible    ${customer1_path}    5s
    Click Element    ${customer1_path}

Enter email in the field
    ${random_email}    Generate Random Email 
    Input Text    ${emailinput_path}    ${random_email}

Input for customer search
    [Arguments]    ${emailcus}    ${fname}    ${lname}    ${company_name} 
    Input Text    ${emailinput_path}    ${emailcus}
    Input Text    ${firstname_path}    ${fname}
    Input Text    ${lastname_path}    ${lname}
    Input Text    ${company_name_path}    ${company_name}
 
Click on search button
    Click Button    ${search_path}

Assert for records available
    ${count}    Get Element Count    ${records_found_path}
    #Log To Console    ${count}
    Should Be True    ${count}>0

    #Table Cell Should Contain    xpath://table[@id='customers-grid']    1    2    ${emailsearch}
    
Assert for no records found
    Page Should Contain    No data available in table
    #Table Cell Should Contain    ${error_message_path}    1    1    No data available in table
    