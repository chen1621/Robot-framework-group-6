*** Settings ***
Documentation  Inventory Management
Library  SeleniumLibrary
#Task Setup  Set Selenium Speed    0.2 seconds

*** Variables ***
${URL}  http://127.0.0.1:8000/
${Browser}  chrome
*** Keywords ***

Open Website
    [Documentation]  This test case verify user is able to open the URL
    Set Selenium Speed    0.3 second
    Open Browser  ${URL}   ${Browser}
    Maximize Browser Window
    Page Should Contain    Inventory Management System

Click Link
    Click Button  Login
Login to your account
    Input Text  username  admin
    Input Text  password  admin
    Click Button  xpath:/html/body/div[2]/div/div/div/div/form/button
    
Add Products
    Click Button  xpath:/html/body/div[3]/div[1]/div[1]/button
    Page Should Contain    Add Products
    Page Should Contain    Product name
    Page Should Contain    Product price
    Page Should Contain    Product quantity
    Input Text  product_name    Tuna    
    Input Text  product_price    10
    Input Text  product_quantity    5
    Click Button    Add Product
    Click Button  Go Back

Checking if it's add to the List
    Click Button  xpath:/html/body/div[3]/div[1]/div[3]/button
    Page Should Contain    Tuna
    Page Should Contain  10
    Page Should Contain  5





