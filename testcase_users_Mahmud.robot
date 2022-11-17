*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${URL}  http://localhost:8000/accounts/login/
${Browser}  chrome
${login_username}  user
${login_password}  user@123
${username}  user180
${password}  user180@123456
${confirm_password}  ${password}
${Wrong_confirmation_password}  user11@12


*** Keywords ***
Go to Website
    [Documentation]  This test case verify if user is able to open the URL
    Open Browser   ${URL}  ${Browser}
    Set Selenium Speed    0.3 second
    Maximize Browser Window
    Page Should Contain   Login

Login to user account
    [Documentation]  This test case verify if user is able to login in the system
    Input Text  username  ${login_username}
    Input Text  password  ${login_password}
    Click Button    //*[@class="btn login-btn btn-block"]   #click on Login button
    Page Should Contain   Dashboard

Add a new user with wrong confirmation password
    [Documentation]  this test case verify if new user can be added with wrong confirmation password
    Click Button    //*[@onclick="location.href='/dashboard/users/'"]    #click on Users button
    Input Text  username  ${username}
    Input Text  password1  ${password}
    Input Text  password2  ${Wrong_confirmation_password}
    Click Button  Add User
    Page Should Contain   ERROR - Does not meet the requirements!
    Click Button  Go Back

Add a new user with correct password
    [Documentation]  this test case verify if new user can be added
    Click Button    //*[@onclick="location.href='/dashboard/users/'"]   #click on Users button
    Input Text  username  ${username}
    Input Text  password1  ${password}
    Input Text  password2  ${confirm_password}
    Click Button  Add User
    Page Should Contain   User Added successfully
  

*** Test Cases ***
Open Website
    Go to Website

Login
    Login to user account

Add user with wrong confirmation password
    Add a new user with wrong confirmation password

Add user with correct password
    Add a new user with correct password


