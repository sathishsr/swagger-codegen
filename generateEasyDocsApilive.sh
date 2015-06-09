rm -r ./easyDocs

java -jar modules/swagger-codegen-cli/target/swagger-codegen-cli.jar generate -i http://easydocs.azurewebsites.net/swagger/docs/v1 -l android -o easyDocs/client/android

java -jar modules/swagger-codegen-cli/target/swagger-codegen-cli.jar generate -i http://easydocs.azurewebsites.net/swagger/docs/v1 -l csharp -o easyDocs/client/csharp

java -jar modules/swagger-codegen-cli/target/swagger-codegen-cli.jar generate -i http://easydocs.azurewebsites.net/swagger/docs/v1 -l objc -o easyDocs/client/ios

cd easyDocs/client/android/

mvn package

cd ../../..

cd easyDocs/ &&  zip -r ../client.zip ./client/ && cd ..

curl -X DELETE -H 'If-Match: *'  https://%24easydocs:imHvgQRcgfbbXQAx6np8fLt0MsGglpTgbX0k46gRScfCS4ql3KM0fScwkksm@easydocs.scm.azurewebsites.net/api/vfs/site/wwwroot/Download/client.zip

curl -i -X PUT -F "file=@./client.zip" -H "Accept: application/json" https://%24easydocs:imHvgQRcgfbbXQAx6np8fLt0MsGglpTgbX0k46gRScfCS4ql3KM0fScwkksm@easydocs.scm.azurewebsites.net/api/vfs/site/wwwroot/Download/client.zip







