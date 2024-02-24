*** Settings ***
Documentation       Components File


*** Variables ***
${URL}              https://the-internet.herokuapp.com/challenging_dom
${VALIDATE_HOME}    //h3[contains(.,'Challenging DOM')]
${BTN_1}            xpath://a[@class='button']
${BTN_2}            xpath://a[contains(@class,'button alert')]
${BTN_3}            xpath://a[contains(@class,'button success')]
${BTN_EDIT}         link:edit
${BTN_DELETE}       link:delete
${URL_EDIT}         https://the-internet.herokuapp.com/challenging_dom#edit
${URL_DELETE}       https://the-internet.herokuapp.com/challenging_dom#delete
${CANVA}            //canvas[contains(@id,'canvas')]
