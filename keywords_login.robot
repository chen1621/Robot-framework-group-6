*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${URL}      http://127.0.0.1:8000/
${Browser}  chrome

*** Keywords ***
Open Website
    [Documentation]  This verify that user is able to open the correct URL
    Set Selenium Speed    0.3 second
    Open Browser  ${URL}    ${Browser}
    Maximize Browser Window
    Page Should Contain    Inventory Management System

Enter Login Page
    Click Button     Login

Input Correct Username and Password
    Input Text    username    admin
    Input Text    password    admin
    Click Button    //div[@class="col-5 mx-auto"]//form//button
    Page Should Contain     Dashboard

Logout
    Click Button    Logout (Admin)
    Page Should Contain    Logout Successful

Go Back to Home Page
    Click Button    Go Back
    Page Should Contain    Inventory Management System

Random User Name
    ${RandomUser}  Generate Random String   10  [LETTERS]
    [Return]    ${RandomUser}

Random Password
    ${RandomPassword}  Generate Random String   10  [LETTERS]
    [Return]    ${RandomPassword}
    
Input Wrong Username and Password
    [Arguments]     ${Username}     ${Password}
    Input Text    username    ${Username}
    Input Text    password    ${Password}
    Click Button    //div[@class="col-5 mx-auto"]//form//button
    # Page Should Contain     Dashboard