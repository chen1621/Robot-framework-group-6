*** Settings ***
Library  SeleniumLibrary
Library    String
Library    Telnet
Resource    keywords_view_available_products.robot

*** Test Cases ***
Go to Website and Login
    Open Website
    Login 

View Available Products  
    Click View Available Products
    Check Available items
    Click Go Back

View Sold Products
    Click View Sold Products
    Check Sold items

Logout
    Click Logout (Admin)