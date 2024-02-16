*** Settings ***
Documentation        Validações na camada de API REST

Library        JSONLibrary
Library        RequestsLibrary
Library        JsonValidator
Resource       env.resource

*** Variables ***
${userId}        ${EMPTY}
${payload}       ${EMPTY}
${valueTitle}    ${EMPTY}
${fieldTitle}    ${EMPTY}
${valueBody}     ${EMPTY}
${fieldBody}     ${EMPTY}
${response}      ${EMPTY}
${path}          ${EMPTY}

*** Keywords ***
Dado que realizo GET no endpoint "${path}"

    #Realiza GET e armazena na variável response
    ${response}        GET       ${API_URL}${path}
    Set Suite Variable     ${response}
     
Quando valido o response "${expectedResponseJson}"

    #Carrega o json esperado e compara com o response
    ${fileJson}    Load Json From File     ${EXECDIR}/resources/fixtures/${expectedResponseJson}.json        encoding=utf-8
    Should Be Equal       ${response.json()}        ${fileJson}     msg=Response diferente do esperado

Então recebo o status code "${expectedStatusCode}"
    
    #Valida o status code
    Status Should Be    ${expectedStatusCode}

E valido o schema "${schema}"

    #Valida se a estrutura do arquivo esta como o esperado 
    Validate Jsonschema From File    ${response.json()}    ${EXECDIR}/resources/fixtures/${schema}.json

Dado que informo "${valueTitle}" no campo "${fieldTitle}" e "${valueBody}" no campo "${fieldBody}"
    Set Suite Variable        ${valueTitle}
    Set Suite Variable        ${fieldTitle}
    Set Suite Variable        ${valueBody}
    Set Suite Variable        ${fieldBody}

Quando realizo POST no endpoint "${path}" para o usuario "${userId}"
    Set Suite Variable        ${userId}
    Set Suite Variable        ${path}

    ${payload}        Create Dictionary         
    ...               ${fieldTitle}=${valueTitle}
    ...               ${fieldBody}=${valueBody}
    ...               ${userId}=${userId}

    # Realiza o POST 
    ${response}     POST    ${API_URL}${path}       
    ...             json=${payload}

Quando realizo PUT no endpoint "${path}" para o usuario "${userId}"
    Set Suite Variable        ${userId}
    Set Suite Variable        ${path}

    ${payload}        Create Dictionary         
    ...               ${fieldTitle}=${valueTitle}
    ...               ${fieldBody}=${valueBody}
    ...               ${userId}=${userId}

    # Realiza o PUT 
    PUT    ${API_URL}${path}       
    ...             json=${payload}

Quando realizo DELETE no endpoint "${path}"
    Set Suite Variable        ${path}

    # Realiza DELETE 
    DELETE    ${API_URL}${path}