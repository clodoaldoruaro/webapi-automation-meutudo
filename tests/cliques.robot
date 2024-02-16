*** Settings ***
Documentation        Suite de teste que valida testes WEB.

Resource          ../resources/base.resource
Resource          ../resources/pageObjects/homePage.resource
Resource          ../resources/pageObjects/challengingDOM.resource

Test Setup        Inicia navegador

*** Test Cases ***
CT001 - Deve clicar nos três botões apresentados na tela

    Acessar a pagina    challenging_dom    Challenging DOM
    Clica nos 3 botões apresentados na tela

CT002 - Deve clicar em todos os botões edit e delete da grid

    Acessar a pagina    challenging_dom    Challenging DOM
    Clica em todos os botões edit e delete da grid