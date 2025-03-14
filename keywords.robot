*** Settings ***
Library    AppiumLibrary

*** Keywords ***
Abrir aplicativo
    Open Application    http://localhost:4723
    ...                 automationName=UiAutomator2
    ...                 platformName=Android
    ...                 deviceName=emulator-5554
    ...                 app=${EXECDIR}/app/app-android.apk

Fechar aplicativo
    Capture Page Screenshot
    Close Application