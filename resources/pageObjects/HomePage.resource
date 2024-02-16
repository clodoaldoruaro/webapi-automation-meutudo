*** Settings ***
Documentation        Elementos da home page

Library         Browser
Resource        ../env.resource

*** Keywords ***
Acessar a pagina
    [Arguments]    ${path}    ${expected-text}

    #Acessa a URL da página passada no path
    Go To        ${WEB_URL}${path}

    #Armazena o título h3 na variável element. Obs. Contém em todas as páginas.
    ${element}        Set Variable         css=h3

    # Checkpoint para validar se a página carregou.
    # Aguarda por 5 segundos o elemento ficar visivel e valida se elemento é igual ao enviado no parâmetro.
    Wait For Elements State        ${element}        visible        5
    Get Text                       ${element}        equal          ${expected-text}