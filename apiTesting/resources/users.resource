*** Settings ***
Resource    base.resource


*** Keywords ***
#CT01-------------------------------------------------------------------------------------------------------------
GET em usuário especifico
    ${RESPOSTA_GET}=    GET On Session    pb    ${BASE_URL}${2}
Validar status code do GET
    Status Should Be    200
Validar se contém user com nome setado
    ${RESPOSTA_GET}=    GET On Session    pb    ${BASE_URL}${2}
    Should Be Equal    Ervin Howell    ${RESPOSTA_GET.json()}[name]

#------------------------------------------------------------------------------------------------------------------

#CT02-------------------------------------------------------------------------------------------------------
Criação de usuário
    ${HEADERS}=    Create Dictionary    content-type=application/json
    ${RESPOSTA_POST}=    POST On Session
    ...    pb
    ...    ${BASE_URL}
    ...    json=${PAYLOAD}
    Set Global Variable    ${HEADERS}

Validar status code
    ${HEADERS}=    Create Dictionary    content-type=application/json
    ${RESPOSTA_POST}=    POST On Session
    ...    pb
    ...    ${BASE_URL}
    ...    json=${PAYLOAD}
    ${ID_NEW_USER}=    Get Value From Json    ${RESPOSTA_POST.json()}    $..id
    Status Should Be    201

Validar id cadastrado
    ${HEADERS}=    Create Dictionary    content-type=application/json
    ${RESPOSTA_POST}=    POST On Session
    ...    pb
    ...    ${BASE_URL}
    ...    json=${PAYLOAD}
    ${ID_NEW_USER}=    Get Value From Json    ${RESPOSTA_POST.json()}    $..id

#-----------------------------------------------------------------------------------------------------------

#CT03 -------------------------------------------------------------------------------
Atualizar um usuário PUT
    ${RESPOSTA_PUT}=    PUT On Session
    ...    pb
    ...    ${BASE_URL}/${3}
    ...    json=${PAYLOAD_2}
    Set Test Variable    ${RESPOSTA_PUT}
Validar status code PUT
    ${RESPOSTA_PUT}=    PUT On Session
    ...    pb
    ...    ${BASE_URL}/${3}
    ...    json=${PAYLOAD_2}
    Set Test Variable    ${RESPOSTA_PUT}
    Status Should Be    200

Validar se alteração consta no response
    ${RESPOSTA_PUT}=    PUT On Session
    ...    pb
    ...    ${BASE_URL}/${3}
    ...    json=${PAYLOAD_2}
    Set Test Variable    ${RESPOSTA_PUT}
    Status Should Be    200
    Should Be Equal    Teste Bauch    ${RESPOSTA_PUT.json()}[name]

#---------------------------------------------------------------------------------------------------------------
#CT04 ---------------------------------------------------------------------------------------------------------------
Deletar um usuário
    ${RESPOSTA_GET}=    GET On Session    pb    ${BASE_URL}
    ${RESPOSTA_DEL}=    DELETE On Session    pb    ${BASE_URL}${4}
    Set Test Variable    ${RESPOSTA_DEL}
Validar status code DELETE
    ${RESPOSTA_GET}=    GET On Session    pb    ${BASE_URL}
    ${RESPOSTA_DEL}=    DELETE On Session    pb    ${BASE_URL}${4}
    Set Test Variable    ${RESPOSTA_DEL}
    Status Should Be    200

Validar que msg do response seja chaves
    ${RESPOSTA_GET}=    GET On Session    pb    ${BASE_URL}
    ${RESPOSTA_DEL}=    DELETE On Session    pb    ${BASE_URL}${4}
    Set Test Variable    ${RESPOSTA_DEL}
    Status Should Be    200

#---------------------------------------------------------------------------------------------------------------

#BDD
#CT01---------------------------------------------------------------------------------------------------------------
que a solicitação GET seja feita no ID do user
    GET em usuário especifico
obter o código de status do GET da solicitação = 200
    GET em usuário especifico
    Validar status code do GET
o response deverá conter as informações do user
    GET em usuário especifico
    Validar status code do GET
    Validar se contém user com nome setado

#CT02---------------------------------------------------------------------------------------------------------------
que a solicitação POST seja feita
    Criação de usuário
seja passado o body em JSON com as informações necessárias
    Criação de usuário
obter o código de status do POST da solicitação = 201
    Validar status code
o response deverá conter os dados do body com o novo id criado
    Validar id cadastrado


#CT03---------------------------------------------------------------------------------------------------------------
que a solicitação PUT seja feita
    Atualizar um usuário PUT
seja atualizado alguma informação no body
    Atualizar um usuário PUT

obter o código de status do PUT da solicitação = 200
    Validar status code PUT

o response deverá conter os dados atualizados
    Validar se alteração consta no response

#CT04---------------------------------------------------------------------------------------------------------------
que a solicitação DELETE seja feita
    Deletar um usuário
obter o código de status do DELETE da solicitação = 200
    Validar status code DELETE
o response deverá conter apenas chaves
    Validar que msg do response seja chaves   