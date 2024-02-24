*** Settings ***
Library         RequestsLibrary
Library         Collections
Library         SeleniumLibrary
Variables       constants.py
Library         JSONLibrary

*** Keywords ***
Create the session
    Create Session    pb    ${BASE_URL}    verify=${True}
