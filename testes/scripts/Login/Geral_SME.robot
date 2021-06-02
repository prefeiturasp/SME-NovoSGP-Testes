*** Settings ***
Resource  ../Resources/Login.robot
Test Teardown  Fechar a página do SGP 

*** Test Cases ***
CT001 - Logar com ADM SME COPED
    Acessar a página de Login do SGP
    Logar com RF "1111149" e Senha "Teste@123"
    Verificar o Perfil "Diretor"
