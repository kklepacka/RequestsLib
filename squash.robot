*** Settings ***
Library    RequestsLibrary
*** Variables ***
${endpoint}    https://admin:admin@acceptance.squashtest.org/nightly-mariadb/squash-tm/api/rest/latest/test-automation-servers  
*** Test Cases ***
#Test get
#    ${response}=    GET    url=${endpoint}
POST and DELETE Request With Json
    [Tags]    post
        ${body}=    Create Dictionary    name=Request    url=https://github.com/AdrianANDRE/RobotTestCharacter.git
        ${resp}=    POST    ${endpoint}    json=${body}
        Status Should Be    201    ${resp}
        DELETE    url=${endpoint}/${resp.json()}[id]
        Status Should Be    201    ${resp}

