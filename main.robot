*** Settings ***
Library     AppiumLibrary

*** Test Cases ***
Open App
    Open Application    http://localhost:4723
    ...                 automationName=UiAutomator2
    ...                 platformName=Android
    ...                 deviceName=emulator-5554
    ...                 app=${EXECDIR}/app/app-android.apk

    Wait Until Page Contains Element    xpath=//*[contains(@text, 'Acesse a conta')]
    Wait Until Page Contains Element    xpath=//*[contains(@text, 'E-mail')]
    Wait Until Page Contains Element    xpath=//*[contains(@text, 'Senha')]
    Wait Until Page Contains Element    xpath=//*[contains(@text, 'Acessar')]
    Wait Until Page Contains Element    xpath=//*[contains(@text, 'Ainda não tem acesso?')]
    Wait Until Page Contains Element    xpath=//*[contains(@text, 'Criar conta')]

    Capture Page Screenshot    1-login-screen.png
    Close Application