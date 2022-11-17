*** Settings ***
Documentation  Login Page Functionality
Library  SeleniumLibrary
Library    String
Resource    keywords_login.robot

*** Test Cases ***
Go to Website
    Open Website

Login with Correct Input
    Enter Login Page
    Input Correct Username and Password
    
Logout from the system
    Logout
    Go Back to Home Page

Login with Wrong Input
    Enter Login Page
    ${Username}=    Random User Name
    ${Password}=    Random Password
    Input Wrong Username and Password    ${Username}    ${Password}
