*** Settings ***
Documentation        Elementos da Challenging DOM

Library         Browser

*** Keywords ***
Clica nos 3 botões apresentados na tela

    #Utilizado xpath validando a class pois é um dos dados que não muda dinâmicamente ao clicar no botão.
    ${button}           Set Variable        xpath=//a[@class='button']
    ${button-alert}     Set Variable        xpath=//a[@class='button alert']
    ${button-success}   Set Variable        xpath=//a[@class='button success']

    #Realiza click nos 3 botões apresentados na tela
    Click       ${button}
    Click       ${button-alert}
    Click       ${button-success}

Clica em todos os botões edit e delete da grid
    
    # Outra forma de ser feito clicando apenas em um sequencial, mas optei por preservar o clique do registro de cada linha caso mude a ordem.
    FOR    ${count}    IN RANGE    0    10
        ${button-edit}        Set Variable        xpath=//td[text()="Phaedrum${count}"]/..//a[text()="edit"]
        ${button-delete}      Set Variable        xpath=//td[text()="Phaedrum${count}"]/..//a[text()="delete"]

        #Realiza click em todos os botões edit e delete da grid
        Click       ${button-edit}
        Click       ${button-delete}
    END