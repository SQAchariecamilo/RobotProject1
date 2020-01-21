*** Settings ***
Library    SeleniumLibrary  
Suite Setup    Log    I am inside Test Suite Setup  
Suite Teardown    Log    I am inside Test Suite Teardown    
Test Setup    Log    I am inside Test Case Setup      
Test Teardown    Log    Executed by %{username} on %{os}   
Default Tags    Sanity   

*** Variables ***
${URL}  https://opensource-demo.orangehrmlive.com/ 
@{CREDENTIALS}    Admin    admin123
&{LGOINDATA}    username=Admin    password=admin123

*** Keywords ***
LoginKW
    Input Text    id=txtUsername    @{CREDENTIALS}[0]    
    Input Password    id=txtPassword    &{LGOINDATA}[password]     
    Click Button    id=btnLogin 

*** Test Cases ***
MyFirstTest
    [Tags]    Smoke
    Log    Hello World...
    Set Tags    Regression1
    Remove Tags    Regression1
    
MySecondTest
    Log    Second Test...
    
MyThirdTest
    Log    Third Test...
    
    
# FirstSeleniumTest
    # Open Browser    https://www.google.com/    chrome
    # Set Browser Implicit Wait    5
    # Input Text    name=q    Facebook    
    # Press Keys    name=q    ENTER
    # # Click Button    name=btnK
    # Sleep    2    
    # Close Browser
    # Log    Test Completed    
   
# SampleLoginTest
    # [Documentation]    This is a sample login test
    # Open Browser      ${URL}     chrome
    # Set Browser Implicit Wait    15
    # LoginKW
    # Click Element    id=welcome   
    # # Click Element    link=Logout
    # Close Browser
    # Log    Test Completed  
    # Log    This test was executed by %{username} on %{os}
    
      