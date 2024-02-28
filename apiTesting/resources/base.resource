*** Settings ***
Library         RequestsLibrary
Library         JSONLibrary
Variables       constants.py

*** Keywords ***
Create the session
    Create Session    pb    ${BASE_URL}    verify=${True}
