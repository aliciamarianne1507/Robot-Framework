*** Settings ***
Documentation     Documentação da API: https://fakerestapi.azurewebsites.net/index.html
Library           RequestsLibrary
Library           Collections



*** Variables ***
${URL_API}        https://fakerestapi.azurewebsites.net/api/v1
&{BOOK_15}       id=15  title=Book 15  pageCount=1500        
*** Keywords ***
#Setup e Teardowns

Conectar minha API
    Create Session        fakeAPI    ${URL_API}


Requisitar todos os livros
    ${RESPOSTA}          Get Request    fakeAPI     Books
    Log                  ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA}

Requisitar o livro "${ID_LIVRO}"
    ${RESPOSTA}          Get Request    fakeAPI     Books/${ID_LIVRO}
    Log                  ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA}

Cadastrar um novo livro
    ${HEADERS}           Create Dictionary     content-type=application/json
    ${RESPOSTA}          Post Request    fakeAPI     Books
    ...                                  data={"id": 265 ,"title": "tESTE","description": "TESTE","pageCount": 500,"excerpt": "TESTE","publishDate": "2020-12-27T17:22:11.613Z"}
    ...                                  headers=${HEADERS}
    Log                  ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA}
#Conferencias: 
Conferir status code
    [Arguments]                     ${STATUSCODE_DESEJADO}       
    BuiltIn.Should Be Equal As Strings       ${RESPOSTA.status_code}       ${STATUSCODE_DESEJADO}

Conferir o reason
    [Arguments]                     ${REASON_DESEJADO}       
    BuiltIn.Should Be Equal As Strings       ${RESPOSTA.reason}       ${REASON_DESEJADO}

Conferir se retorna uma lista com "${QTDE_LIVROS}" livros
    Length Should Be   ${RESPOSTA.json()}      ${QTDE_LIVROS}

Conferir se retorna todos os dados corretos do livro 15
    Dictionary Should Contain Item   ${RESPOSTA.json()}   id           ${BOOK_15.id}
    Dictionary Should Contain Item   ${RESPOSTA.json()}   title        ${BOOK_15.title}
    Should Not Be Empty              ${RESPOSTA.json()["description"]}
    Dictionary Should Contain Item   ${RESPOSTA.json()}   pageCount    ${BOOK_15.pageCount}
    Should Not Be Empty              ${RESPOSTA.json()["publishDate"]}