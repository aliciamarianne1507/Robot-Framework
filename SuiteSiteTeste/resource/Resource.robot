*** Settings ***
Library        SeleniumLibrary

*** Variables ***
${BROWSER}   chrome
${URL}       http://automationpratice.com


*** Keywords ***
# Setup e Teardow 
Abrir navegador
    Open Browser  about:blank   ${BROWSER}

Fechar navegador
    Close Browser

################################################################

Acessar a página home do site
    Go to             ${URL}  
    Title Should Be   My Store