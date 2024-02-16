*** Settings ***
Documentation        Suite de teste que valida API REST.

Resource          ../resources/base.resource
Resource          ../resources/services.resource

*** Test Cases ***

##### GET #####

CT001 - GET no /users, valida response, schema e status code
    Dado que realizo GET no endpoint "users"
    Quando valido o response "responseUsers"
    Então recebo o status code "200"
    E valido o schema "schemaUsers"

CT002 - GET no /posts, valida response, schema e status code
    Dado que realizo GET no endpoint "posts"
    Quando valido o response "responsePosts"
    Então recebo o status code "200"
    E valido o schema "schemaPosts"

CT003 - GET no /comments, valida response, schema e status code
    Dado que realizo GET no endpoint "comments"
    Quando valido o response "responseComments"
    Então recebo o status code "200"
    E valido o schema "schemaComments"

##### POST #####

CT004 - POST no /posts e valida response status
    Dado que informo "Meu post" no campo "title" e "Post diário" no campo "body"
    Quando realizo POST no endpoint "posts" para o usuario "10"
    Então recebo o status code "201"

##### PUT #####

CT005 - PUT no /posts/1 e valida response status
    Dado que informo "Novo titulo" no campo "title" e "Post Alterado com sucesso" no campo "body"
    Quando realizo PUT no endpoint "posts/1" para o usuario "10"
    Então recebo o status code "200"

##### DELETE #####

CT006 - DELETE no /posts/1 e valida response status
    Quando realizo DELETE no endpoint "posts/5"
    Então recebo o status code "200"