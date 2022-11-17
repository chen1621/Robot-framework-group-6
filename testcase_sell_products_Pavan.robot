*** Settings ***
Documentation  Selling Products Functionality
Library  SeleniumLibrary
Library    String

*** Variables ***
${URL}      http://127.0.0.1:8000/
${Browser}  chrome

*** Test Cases ***
Go to Website
    Open Website
    Enter Login Page
    Input Correct Username and Password

click sellproducts
      sellproducts
selling products
     Select selling product
Go back to dashboard
    view sold products
Logout from the system
    Logout
    Go Back to Home Page

*** Keywords ***

Open Website
    [Documentation]  This verify that user is able to open the correct URL
    Set Selenium Speed    0.2 second
    Open Browser  ${URL}    ${Browser}
    Maximize Browser Window
    Page Should Contain    Inventory Management System

Enter Login Page
    Click Button     Login

Input Correct Username and Password
    [Documentation]   This test case verify user is able to open the URL
    Input Text    username    admin
    Input Text    password    admin
    Click Button    //div[@class="col-5 mx-auto"]//form//button
    Page Should Contain     Dashboard

sellproducts
    [Documentation]  This section is to sell products
   Click Button     xpath:/html/body/div[3]/div[2]/div[1]/button
   page should contain   Sell Products

Select selling product
   [Documentation]   This section is to choose to selling products and quantity
   select from list by index  product_id  2
   Click Button  xpath:/html/body/div[2]/div/div/form/div[2]/input
   Input Text  sellqty  2
   click Button  xpath:/html/body/div[2]/div/div/form/div[3]/button
   Page should contain  Product sold successfully

view sold products
   [Documentation]   1. this section is to choose click dashboard icon and to view all the sold products
   Click Element   xpath:/html/body/div[1]/a
   page should contain  Dashboard
   Set Selenium Speed    0.5 second
   Click Button  xpath:/html/body/div[3]/div[2]/div[2]/button
   Page should contain  Sold Products

Logout
    [Documentation]  logging out
    Click Button    Logout (Admin)
    Page Should Contain    Logout Successful
    Set Selenium Speed    0.5 second

Go Back to Home Page
    [Documentation]    Going back to home page
    Click Button    Go Back
    Page Should Contain    Inventory Management System

