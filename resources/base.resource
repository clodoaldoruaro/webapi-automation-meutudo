*** Settings ***
Documentation        Arquivo base, contém atividade comuns e configurações de sessão

Library         Browser
Resource        env.resource

*** Keywords ***
#Inicia o navegador na home page com modo visual ativado (headless=off)
Inicia navegador

    New Browser     ${BROWSER}        headless=off
    New Page        ${WEB_URL}