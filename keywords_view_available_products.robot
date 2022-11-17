*** Settings ***
Library  SeleniumLibrary
Library    String

*** Variables ***
${SiteUrl}  http://127.0.0.1:8000/
${Browser}  Chrome

*** Keywords ***
Open Website
    [Documentation]  This verify that user is able to open the correct URL
    Set Selenium Speed    0.3 second
    Open Browser  ${SiteUrl}    ${Browser}
    Maximize Browser Window


Login
    Click Button     Login
    Input Text    username    admin
    Input Text    password    admin
    Click Button    //div[@class="col-5 mx-auto"]//form//button


Click View Available Products  
    Click Button    xpath:/html/body/div[3]/div[1]/div[3]/button


Check Available items
    Page should contain    Product ID
    Page should contain    Product Name
    Page should contain    Product Price
    Page should contain    Quantity

Click Go Back
    Click Button    Go Back

Click View Sold Products
    Click Button    xpath:/html/body/div[3]/div[2]/div[2]/button

Check Sold items
    Page should contain    Date Time
    Page should contain    Product ID
    Page should contain    Product Name
    Page should contain    Product Price
    Page Should Contain    Quantity

Click Logout (Admin)
    Click Button    Logout (Admin)
