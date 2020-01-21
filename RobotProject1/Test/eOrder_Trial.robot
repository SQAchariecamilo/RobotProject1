*** Settings ***
Library    SeleniumLibrary  
Test Teardown    Log    Executed by %{username} on %{os}    

*** Variables ***
${eO_URL}  https://tier3-ordering-portal-dev.ase2np.pgcloud.com/#/orders    #eOrder portal URL
${EDI_URL}    https://customer-edi-portal-dev.ase2np.pgcloud.com/    #EDI portal URL
${EDI2_URL}    https://customer-edi-portal2.ase2np.pgcloud.com/projects/opened    #EDI2 portal URL

*** Test Cases ***
eOrder_Trial
    Open Browser    ${eO_URL}   chrome
    Maximize Browser Window
    Input Text    name=loginfmt    camilo.cc@pg.com   
    Click Button    id=idSIButton9 
    Sleep    5    
    Input Password    id=password    Test1234   
    Click Button    id=loginButton
    Input Text    id=otp    487149    
    Press Keys    id=otp    ENTER     
    Set Browser Implicit Wait    5 
    Sleep    10 
    
    Set Focus To Element    id=sOrg
    Sleep    5    
    Input Text    id=sOrg    FR56
    Press Keys    id=sOrg    ENTER
    Sleep    5  
  
    Input Text    id=sChannel    01
    Input Text    id=divi    22
    Input Text    id=poNumber    KIJASKJD34523   
    Input Text    id=soldToParty    2000383481
    Input Text    id=shipToParty    2000383481   
    Click Element    xpath://button[@class='btn btn-outline-primary w-100']  
    sleep    10      
    Close Browser
    
EDI_trial
    Open Browser    ${EDI2_URL}    chrome
    Set Browser Implicit Wait    5
    # Click Element    link=Start new project    
    Close Browser
    