*** Settings ***
Resource       ..\resource\Resource.robot    
Test Setup     Abrir navegador
Test Teardown  Fechar navegador

*** Variables ***


*** Test Cases ***

Caso de Teste 01: Pesquisar produto existente com
    Acessar a página home do site
    #Conferir se a página home foi exibida
    #Digitar o nome do produto "Blouse" no campo de pesquisa 
    #Clicar no botão de Pesquisar
    #Conferir se o produto "Blouse" foi listado no site 

#Caso de Teste 02: Pesquisar produto inexistente 
    #Acessar a página home do site
    #Conferir se a página home foi exibida
    #Digitar o nome do produto "produtoNãoExistente" no campo de pesquisa 
    #Clicar no botão de Pesquisar
    #Conferir se o produto "No results were found for your search "produtoNãoExistente"" foi listado no site 

*** Keywords ***