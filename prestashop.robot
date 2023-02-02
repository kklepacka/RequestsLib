*** Settings ***
Library    RequestsLibrary
Library    OperatingSystem
Resource    test.xml


*** Variables ***
${endpoint}   https://sut-test-adrian.squashcloud.io
${URI}     /api/carriers/
${BASE_64_TOKEN}    SlQxSVZXR1FINTdFMUJWTjhSSDE4TFFJQkdVWktSN1Q6
#${TOKEN}    JT1IVWGQH57E1BVN8RH18LQIBGUZKR7T  
# online conversion from string token to base64 formatted type : user:password 
#(password='')
#JT1IVWGQH57E1BVN8RH18LQIBGUZKR7T:  =>  SlQxSVZXR1FINTdFMUJWTjhSSDE4TFFJQkdVWktSN1Q6


*** Test Cases ***
POST and DELETE
    
    ${xml}=    Get File    RequestsLib/test.xml
    ${header}=    Create Dictionary    Authorization=Basic ${BASE_64_TOKEN}    output_format=JSON
    ${response}=    POST    url=${endpoint}${URI}    headers=${header}    data=${xml}
    DELETE    url=${endpoint}${URI}${response.json()}[carrier][id]    headers=${header}
