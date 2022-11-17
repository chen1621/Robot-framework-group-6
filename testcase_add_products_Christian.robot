*** Settings ***
Documentation  Add Products Funtionality
Library  SeleniumLibrary
Resource  keywords_add_products.robot
#Task Setup  Set Selenium Speed    0.2 seconds

*** Test Cases ***

Login, Product List, Add Product
    Open Website
    Click Link
    Login to your account
    Add Products
    Checking if it's add to the List
    Click Button    Logout (Admin)
    Click Button    Go Back
