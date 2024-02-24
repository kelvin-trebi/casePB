*** Settings ***
Resource        ../resources/users.resource
Resource        ../resources/constants.py

Test Setup      Create the session


*** Test Cases ***
 CT01 - Buscar cadastro de um usuário (GET)
    GET em usuário especifico
    Given que a solicitação GET seja feita no ID do user
    When obter o código de status do GET da solicitação = 200
    Then o response deverá conter as informações do user

 CT02 - Criar um novo usuário (POST)
    Criação de usuário
    Given que a solicitação POST seja feita
    And seja passado o body em JSON com as informações necessárias
    When obter o código de status do POST da solicitação = 201
    Then o response deverá conter os dados do body com o novo id criado

 CT03 - Atualizar as informações do usuário (PUT)
    Atualizar um usuário PUT
    Given que a solicitação PUT seja feita
    And seja atualizado alguma informação no body
    When obter o código de status do PUT da solicitação = 200
    Then o response deverá conter os dados atualizados

 CT04 - Deletar o cadastro de um usuário (DELETE)
    Deletar um usuário
    Given que a solicitação DELETE seja feita
    When obter o código de status do DELETE da solicitação = 200
    Then o response deverá conter apenas chaves
