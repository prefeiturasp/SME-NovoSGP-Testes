*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL_SGP}          http://sme-webclient-testes/
${BROWSER}      chrome
${INPUT_USUARIO}  id=usuario
${INPUT_SENHA}  id=senha
${BUTTON_ACESSAR}  xpath=//button[contains(text(),"Acessar")]
${PAGE_VERSION}  xpath=//*[@id="root"]//strong[contains(text(),"Versão")]
${MENU_LATERAL}  id=main
${CAMPO_PERFIL}  xpath=//li[2]/div[contains(@class, "position-relative")]/a
${QTD_PERFIL} =  xpath=//div/table/tbody/tr 

*** Keywords ***
Acessar a página de Login do SGP
#add_argument("--headless");
    Open Browser  ${URL_SGP}  ${BROWSER}  options=add_argument("--disable-web-security");add_argument("--start-maximized");add_experimental_option("excludeSwitches", ["enable-logging"])
    Wait Until Element Is Visible  ${PAGE_VERSION}

Logar com RF "${RF_LOGIN}" e Senha "${RF_Senha}" 
    Click Element  ${INPUT_USUARIO}
    Input Text  ${INPUT_USUARIO}  ${RF_LOGIN}
    Click Element  ${INPUT_SENHA} 
    Input Text  ${INPUT_SENHA}  ${RF_Senha} 
    Click Element  ${BUTTON_ACESSAR}
    Sleep  2s
    Wait Until Element Is Visible  ${MENU_LATERAL}

Verificar o Perfil "${PERFIL_ESPERADO}"
    Wait Until Element Is Visible  ${CAMPO_PERFIL}
    ${nome_perfil} =  Get Text  ${CAMPO_PERFIL}
    ${count} =  Get Element Count  ${QTD_PERFIL}

    Run keyword if  '${nome_perfil}' == '${PERFIL_ESPERADO}'
    ...  Element Text Should Be  ${CAMPO_PERFIL}  ${PERFIL_ESPERADO}
    ...  ELSE  Run keywords
    ...  Click Element  ${CAMPO_PERFIL}
	...  AND  Click Element   xpath=//*[@id="root"]//div//tr/td[2 and contains(text(),"${PERFIL_ESPERADO}")]
    ...  AND  Sleep  2s
	...  AND  Element Text Should Be  ${CAMPO_PERFIL}  ${PERFIL_ESPERADO}

Fechar a página do SGP    
    Close Browser	