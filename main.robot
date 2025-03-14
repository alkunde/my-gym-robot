*** Settings ***
Library     AppiumLibrary
Resource    keywords.robot

Test Setup       Abrir aplicativo
Test Teardown    Fechar aplicativo

*** Test Cases ***
Open App
    Wait Until Page Contains Element    xpath=//*[contains(@text, 'Acesse a conta')]
    Wait Until Page Contains Element    xpath=//*[contains(@text, 'E-mail')]
    Wait Until Page Contains Element    xpath=//*[contains(@text, 'Senha')]
    Wait Until Page Contains Element    xpath=//*[contains(@text, 'Acessar')]
    Wait Until Page Contains Element    xpath=//*[contains(@text, 'Ainda não tem acesso?')]
    Wait Until Page Contains Element    xpath=//*[contains(@text, 'Criar conta')]

Apresentar mensagens de erro ao clicar no botão Acessar
    Wait Until Page Contains Element    xpath=//*[contains(@text, 'Acesse a conta')]
    Click Element                       xpath=//*[contains(@text, 'Acessar')]
    Wait Until Element Is Visible       xpath=//*[contains(@text, 'Informe o e-mail')]
    Wait Until Element Is Visible       xpath=//*[contains(@text, 'Informe a senha')]

Apresentar mensagem de erro no campo de senha ao clicar no botão Acessar
    Wait Until Page Contains Element    xpath=//*[contains(@text, 'Acesse a conta')]
    Input Text                          xpath=//*[contains(@text, 'E-mail')]                    andrelbkunde@gmail.com

Abrir a tela de cadastro de usuário
    Wait Until Page Contains Element    xpath=//*[contains(@text, 'Acesse a conta')]
    Click Element                       xpath=//*[contains(@text, 'Criar conta')]

    Wait Until Page Contains Element    xpath=//*[contains(@text, 'Crie sua conta')]
    Wait Until Page Contains Element    xpath=//*[contains(@text, 'Nome')]
    Wait Until Page Contains Element    xpath=//*[contains(@text, 'E-mail')]
    Wait Until Page Contains Element    xpath=//*[contains(@text, 'Senha')]
    Wait Until Page Contains Element    xpath=//*[contains(@text, 'Confirmar senha')]
    Wait Until Page Contains Element    xpath=//*[contains(@text, 'Criar e acessar')]
    Scroll    10    20
    Wait Until Page Contains Element    xpath=//*[contains(@text, 'Voltar para o login')]