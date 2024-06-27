*** Settings ***
Documentation    Edit Details resource page contains reusable variables and keywords
Library    SeleniumLibrary

*** Variables ***
#Loactors to locate
${edit_path}    xpath://tbody//a[@class='btn btn-default']
${editemail_path}    id:Email
${password_path}	    id:Password
${changepassword_path}    xpath://button[@class="btn btn-info"]
${fname_path}    id:FirstName
${lname_path}	id:LastName
${dob_path}    id:DateOfBirth
${company_name_edit_path}    id:Company
${tax_path}    xpath://input[@id='IsTaxExempt']
${newsletter_path}	
${role_path}	id:SelectedCustomerRoleIds
${manager_of_vendors_path}	id:VendorId
${active_path}	id:Active
${admin_content_path}    css:#AdminComment
${save_button_path}    xpath://button[@class="btn btn-primary" and @name="save"]
${back_page_path}    xpath://a[@href="/Admin/Customer/List" and normalize-space()='back to customer list']
${save_continue_path}    save-continue
${delete_path}    id:customer-delete
${delete_yes_path}    xpath://button[@type='submit' and @class='btn btn-danger float-right']

*** Keywords ***
#To click on edit button
Click on edit button
    Wait Until Element Is Visible    ${edit_path}
    Scroll Element Into View    ${edit_path}
    Click Element   ${edit_path}

#To check whether the page navigates to edit page ornot
Verify edit button navigates to edit page
    Page Should Contain    Edit customer details

#Provide details to edit
Edit inforamtion provided
    [Arguments]    ${editemail}    ${password}    ${fname}    ${lname}    ${gender}    ${dob}    ${company_name}    ${tax}    ${manager_of_vendor}    ${active}    ${admin_content}
    Set Selenium Speed    1
    Clear Element Text    ${editemail_path}
    Input Text    ${editemail_path}    ${editemail}
    Input Password    ${password_path}    ${password}
    Input Text    ${fname_path}    ${fname}
    Input Text    ${lname_path}    ${lname}
    Handle gender box    ${gender}
    Input Text    ${dob_path}    ${dob}
    Input Text    ${company_name_edit_path}    ${company_name}
    Handle tax checkbox    ${tax}
    Select From List By Label    ${manager_of_vendors_path}    ${manager_of_vendor}
    Handle active box    ${active}
    #Run Keyword If    '${active}' == 'yes' or '${active}' == ''    Select Checkbox    ${active_path}
    #...    ELSE    Unselect Checkbox    ${active_path}
    Input Text    ${admin_content_path}    ${admin_content}

#Handle for tax
Handle tax checkbox
    [Arguments]    ${tax}
    Wait Until Element Is Visible    ${tax_path}    5s
    ${selected}=    Get Element Attribute    ${tax_path}    checked
    Run Keyword If    '${tax}' == 'yes' and 'not ${selected}' == 'false'    Select Checkbox    ${tax_path}
    ...    ELSE IF    '${tax}' == 'no' and '${selected}' == 'true'    Unselect Checkbox    ${tax_path}

#Update account active
Handle active box
    [Arguments]    ${active}
    Wait Until Element Is Visible    ${active_path}    5s
    ${selected}=    Get Element Attribute    ${tax_path}    checked
    Run Keyword If    '${active}' == 'yes' and 'not ${selected}' == 'false'    Select Checkbox    ${active_path}
    ...    ELSE IF    '${active}' == 'no' and '${selected}' == 'true'    Unselect Checkbox    ${active_path}

#Update gender
Handle gender box
    [Arguments]    ${gender}
    Run Keyword If    '${gender}'=='male'    Select Radio Button    Gender    M     
    ...    ELSE IF    '${gender}'=='female'    Select Radio Button    Gender    F 

#Handle customer role
Handle custome role
    [Arguments]    @{role}
    Unselect All From List    ${role_path}
    FOR  ${i}  IN  @{role}
        Select From List By Label    ${role_path}    ${i}
    END

#After edit save btn is clicked
Click on save button
    Click Button    ${save_button_path}

#Save and edit button
Click on save-continue button
    Click Button    ${save_continue_path}

#Delete button 
Click on delete button
    Click Element    ${delete_path}

Click on yes delete button
    Wait Until Element Is Visible    ${delete_yes_path}
    Click Button    ${delete_yes_path}
    Page Should Contain    The customer has been deleted successfully.


#Change password
Change Password in edit option
    [Arguments]    ${password}
    Input Password    ${password_path}    ${password}
    Click Button    ${changepassword_path}

#Back to customer list page
Click on back to page
    Click Link    ${back_page_path}

#Assert for main page
Assert main page is navigated
    Page Should Contain Link    //a[@href="/Admin/Customer/Create"]

#Assert for empty password field
Assert password error message
    Page Should Contain    Password is not entered

#Assert for same password field
Assert password is already same
    Page Should Contain    You entered the password that is the same as one of the last passwords you used. Please create a new password.

#Assert for password is correct
Assert password is correct
    Page Should Contain    The password has been changed successfully.

#Assert for edit is successfull
Assert edit is successfull
    Page Should Contain    The customer has been updated successfully.

