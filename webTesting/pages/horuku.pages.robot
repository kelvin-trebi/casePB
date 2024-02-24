*** Settings ***

Resource        ../components/components.robot 
Resource        ../pages/commons/hooks.pages.commons.robot

*** Keywords ***

#Case01
Validar acesso ao site
    Wait Until Element Is Visible   ${VALIDATE_HOME}

Clicar elemento 1
    Wait Until Element Is Visible   ${BTN_1}
    Click Element    ${BTN_1}
    Capture Element Screenshot    ${CANVA}

Clicar elemento 2
    Wait Until Element Is Visible   ${BTN_2}
    Click Element    ${BTN_2}
    Capture Element Screenshot    ${CANVA}

Clicar elemento 3
    Wait Until Element Is Visible   ${BTN_3}
    Click Element    ${BTN_3}
    Capture Element Screenshot    ${CANVA}



#Case02
Clicar em edit
    Wait Until Element Is Visible       ${BTN_EDIT}
    Click Link  ${BTN_EDIT}

Validar se botão foi clicado na url edit
    Location Should Contain    ${URL_EDIT}

Clicar em delete
   Click Link  ${BTN_DELETE}

Validar se botão foi clicado na url delete
    Location Should Contain   ${URL_DELETE}




#GHERKIN BDD
#Case01
Dado que o usuário tenha acessado o Challenging DOM
    Validar acesso ao site

Quando realizar a interação com elemento 1
    Clicar elemento 1

E realizar interação com elemento 2
    Clicar elemento 2

E realizar interação com elemento 3
    Clicar elemento 3

Então comparo os prints de cada interação
    Capture Page Screenshot

#Case02

Quando clicar em edit
    Clicar em edit
    Validar se botão foi clicado na url edit

E clicar em delete
    Clicar em delete
    Validar se botão foi clicado na url delete

Então o último link clicado possui a url #Delete
    Validar se botão foi clicado na url delete
    