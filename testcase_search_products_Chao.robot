*** Settings ***
Documentation  Search Products Page Functionality
Library  SeleniumLibrary
Library    String
Resource    keywords_search_products.robot

*** Test Cases ***
Go to Website and Login
    Open Website
    Enter Login Page
    Input Username and Password

Check Search Products section with correct input
    Go to Search Products section
    Enter correct product name
    Check the products info
    Go Back to Home Page

Check Search Products section with incorrect input
    Go to Search Products section
    Enter incorrect product name
    Check prompt for wrong input

Logout from the system
    Logout
    