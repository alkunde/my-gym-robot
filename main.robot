*** Settings ***
Library     AppiumLibrary
Resource    keywords.robot

Test Setup       Abrir aplicativo
Test Teardown    Fechar aplicativo

*** Test Cases ***
Open App
    Wait Until Page Contains Element    xpath=//*[contains(@text, 'E-mail')]
    Wait Until Page Contains Element    xpath=//*[contains(@text, 'Senha')]
    Wait Until Page Contains Element    xpath=//*[contains(@text, 'Acessar')]
    Wait Until Page Contains Element    xpath=//*[contains(@text, 'Ainda não tem acesso?')]
    Wait Until Page Contains Element    xpath=//*[contains(@text, 'Criar conta')]

Apresentar mensagens de erro ao clicar no botão Acessar
    Click Element                       xpath=//*[contains(@text, 'Acessar')]
    Wait Until Element Is Visible       xpath=//*[contains(@text, 'Informe o e-mail')]
    Wait Until Element Is Visible       xpath=//*[contains(@text, 'Informe a senha')]

Apresentar mensagem de erro no campo de senha ao clicar no botão Acessar
    Input Text                          xpath=//*[contains(@text, 'E-mail')]                   andrelbkunde@gmail.com

Abrir a tela de cadastro de usuário
    Click Element                       xpath=//*[contains(@text, 'Criar conta')]

    Wait Until Page Contains Element    xpath=//*[contains(@text, 'Crie sua conta')]
    Wait Until Page Contains Element    xpath=//*[contains(@text, 'Nome')]
    Wait Until Page Contains Element    xpath=//*[contains(@text, 'E-mail')]
    Wait Until Page Contains Element    xpath=//*[contains(@text, 'Senha')]
    Wait Until Page Contains Element    xpath=//*[contains(@text, 'Confirmar senha')]
    Wait Until Page Contains Element    xpath=//*[contains(@text, 'Criar e acessar')]
    Wait Until Page Contains Element    xpath=//*[contains(@text, 'Voltar para o login')]

Efetuar login com sucesso
    Input Text                          xpath=//*[contains(@text, 'E-mail')]                   andrelbkunde@gmail.com
    Input Text                          xpath=//*[contains(@text, 'Senha')]                    123456

    Click Element                       xpath=//*[contains(@text, 'Acessar')]

    Wait Until Page Contains Element    xpath=//*[contains(@text, 'Andre')]                    10s

Erro ao clicar em Criar conta sem ter informado os campos
    Click Element                       xpath=//*[contains(@text, 'Criar conta')]

    Wait Until Page Contains Element    xpath=//*[contains(@text, 'Crie sua conta')]
    Click Element                       xpath=//*[contains(@text, 'Criar e acessar')]
    Wait Until Element Is Visible       xpath=//*[contains(@text, 'Informe o nome')]
    Wait Until Element Is Visible       xpath=//*[contains(@text, 'Informe o e-mail')]
    Wait Until Element Is Visible       xpath=//*[contains(@text, 'Informe a senha')]
    Wait Until Element Is Visible       xpath=//*[contains(@text, 'Confirme a senha')]

Criar um usuário com sucesso
    Click Element                       xpath=//*[contains(@text, 'Criar conta')]

    Wait Until Page Contains Element    xpath=//*[contains(@text, 'Crie sua conta')]
    Input Text                          xpath=//*[contains(@text, 'Nome')]                     André
    Input Text                          xpath=//*[contains(@text, 'E-mail')]                   andrelbkunde@gmail.com
    Input Text                          xpath=//*[contains(@text, 'Senha')]                    123456
    Input Text                          xpath=//*[contains(@text, 'Confirmar senha')]          123456

    Click Element                       xpath=//*[contains(@text, 'Criar e acessar')]

    Wait Until Page Contains Element    xpath=//*[contains(@text, 'Andre')]                    10s

Erro ao tentar criar um usuário já existente
    Click Element                       xpath=//*[contains(@text, 'Criar conta')]

    Wait Until Page Contains Element    xpath=//*[contains(@text, 'Crie sua conta')]
    Input Text                          xpath=//*[contains(@text, 'Nome')]                     Patricia
    Input Text                          xpath=//*[contains(@text, 'E-mail')]                   patricia@gmail.com
    Input Text                          xpath=//*[contains(@text, 'Senha')]                    123456
    Input Text                          xpath=//*[contains(@text, 'Confirmar senha')]          123456

    Click Element                       xpath=//*[contains(@text, 'Criar e acessar')]

    Wait Until Page Contains Element    xpath=//*[contains(@text, 'Este e-mail já está em uso.')]    10s

Falha de conexão com a internet ao tentar cadastrar usuário
    Click Element                       xpath=//*[contains(@text, 'Criar conta')]

    Wait Until Page Contains Element    xpath=//*[contains(@text, 'Crie sua conta')]
    Input Text                          xpath=//*[contains(@text, 'Nome')]                     Fulano
    Input Text                          xpath=//*[contains(@text, 'E-mail')]                   fulano@gmail.com
    Input Text                          xpath=//*[contains(@text, 'Senha')]                    123456
    Input Text                          xpath=//*[contains(@text, 'Confirmar senha')]          123456

    Click Element                       xpath=//*[contains(@text, 'Criar e acessar')]

    Wait Until Page Contains Element    xpath=//*[contains(@text, 'Falha de conexão com a internet.')]    10s

Erro ao efetuar login com dados inválidos
    Input Text                          xpath=//*[contains(@text, 'E-mail')]                   patricia@gmail.com
    Input Text                          xpath=//*[contains(@text, 'Senha')]                    123456

    Click Element                       xpath=//*[contains(@text, 'Acessar')]

    Wait Until Page Contains Element    xpath=//*[contains(@text, 'Usuário não encontrado.')]       10s

Falha de conexão com a internet ao tentar efetuar o login
    Input Text                          xpath=//*[contains(@text, 'E-mail')]               fulano@gmail.com
    Input Text                          xpath=//*[contains(@text, 'Senha')]                123456

    Click Element                       xpath=//*[contains(@text, 'Acessar')]

    Wait Until Page Contains Element    xpath=//*[contains(@text, 'Falha de conexão com a internet.')]    10s