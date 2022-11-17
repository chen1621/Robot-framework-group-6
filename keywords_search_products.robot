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

Enter Login Page
    Click Button     Login

Input Username and Password
    Input Text    username    admin
    Input Text    password    admin
    Click Button    //div[@class="col-5 mx-auto"]//form//button
    Page Should Contain     Dashboard

Logout
    Click Button    Logout (Admin)
    Page Should Contain    Logout Successful

Go Back to Home Page
    Click Button    Go Back

Go to Search Products section
    Click Button    xpath:/html/body/div[3]/div[1]/div[2]/button

Enter correct product name
    Input Text    search_product    Tuna
    Click Button    xpath:/html/body/div[2]/div/div/form/div/button

Enter incorrect product name
    Input Text    search_product    tuna
    Click Button    xpath:/html/body/div[2]/div/div/form/div/button

Check the products info
    Title Should Be    Search Result - IMS
    Page Should Contain    Product ID
    Page Should Contain    Product Name
    Page Should Contain    Product Price
    Page Should Contain    Quantity
    Page Should Contain    Tuna

Check prompt for wrong input
    Page Should Contain    No Products

