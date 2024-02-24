*** Settings ***

Resource            ../pages/horuku.pages.robot

Test Setup          Start Test
Test Teardown       Finish Test


*** Test Cases ***
CT01 - Acessar o site herokuapp e clicar nos 3 elementos
    [Documentation]    Este teste verificará se o acesso aconteceu
    ...    e os clicks dos botões
    [Tags]    botões_laterais
    Dado que o usuário tenha acessado o Challenging DOM
    Quando realizar a interação com elemento 1
    E realizar interação com elemento 2
    E realizar interação com elemento 3
    Então comparo os prints de cada interação

CT02 - Acessar o site herokuapp e clicar em edit e delete
    [Documentation]    Este teste verificará se os clicks em edit e delete estão acontecendo
    [Tags]    botões_grid
    Dado que o usuário tenha acessado o Challenging DOM
    Quando clicar em edit
    E clicar em delete
    Então o último link clicado possui a url #Delete
    