*** Settings ***
Library    RequestsLibrary
Library    OperatingSystem

*** Test Cases ***
#GET url access
#    GET    url=https://sut-test-adrian.squashcloud.io/api/carriers/9?ws_key=JT1IVWGQH57E1BVN8RH18LQIBGUZKR7T


POST and DELETE
    ${xml}=    Get File    request/test.xml
    ${response}=    POST    url=https://sut-test-adrian.squashcloud.io/api/carriers?ws_key=JT1IVWGQH57E1BVN8RH18LQIBGUZKR7T&output_format=JSON    data=${xml}
    DELETE    url=https://sut-test-adrian.squashcloud.io/api/carriers/${response.json()}[carrier][id]?ws_key=JT1IVWGQH57E1BVN8RH18LQIBGUZKR7T
