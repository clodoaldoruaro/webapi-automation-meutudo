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
${responseGet}   ${EMPTY}
${responsePost}  ${EMPTY}
${path}          ${EMPTY}

*** Keywords ***
Dado que realizo GET no endpoint "${path}"

    #Realiza GET e armazena na variável response
    ${responseGet}        GET       ${API_URL}${path}
    Set Suite Variable     ${responseGet}
     
Quando valido o response "${expectedResponseJson}"

    #Carrega o json esperado e compara com o response
    ${fileJson}    Load Json From File     ${EXECDIR}/resources/fixtures/${expectedResponseJson}.json        encoding=utf-8
    Should Be Equal       ${responseGet.json()}        ${fileJson}     msg=Response diferente do esperado

Então recebo o status code "${expectedStatusCode}"
    
    #Valida o status code
    Status Should Be    ${expectedStatusCode}

E valido o schema "${schema}"

    #Valida se a estrutura do arquivo esta como o esperado 
    Validate Jsonschema From File    ${responseGet.json()}    ${EXECDIR}/resources/fixtures/${schema}.json

Dado que informo "${valueTitle}" no campo title e "${valueBody}" no campo body
    
    #Seta as variáveis para serem visíveis em toda a suíte de teste
    Set Suite Variable        ${valueTitle}
    Set Suite Variable        ${valueBody}

Quando realizo POST no endpoint "${path}" para o usuario "${userId}"
    
    #armazena os dados para enviar no payload
    ${payload}        Create Dictionary         
    ...               title=${valueTitle}
    ...               body=${valueBody}
    ...               userId=${userId}

    # Realiza o POST 
    ${responsePost}      POST    ${API_URL}${path}       
    ...    json=${payload}
    Set Suite Variable    ${responsePost}

Quando realizo PUT no endpoint "${path}" para o usuario "${userId}"

    #armazena os dados para enviar no payload
    ${payload}        Create Dictionary         
    ...               title=${valueTitle}
    ...               body=${valueBody}
    ...               userId=${userId}
    ...               id=${responsePost.json()}[id]

    # Realiza o PUT 
    PUT    ${API_URL}${path}       
    ...             json=${payload}

Quando realizo DELETE no endpoint "${path}"
    Set Suite Variable        ${path}

    # Realiza DELETE 
    DELETE    ${API_URL}${path}