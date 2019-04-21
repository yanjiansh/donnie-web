cd $(dirname $0)
cd ../initial

mvn clean compile
ret=$?
if [ $ret -ne 0 ]; then
exit $ret
fi
rm -rf target

./gradlew compileJava
ret=$?
if [ $ret -ne 0 ]; then
exit $ret
fi
rm -rf build

cd ../complete
mvn clean package

# if [ "${TRAVIS_PULL_REQUEST}" = "false" ]; 
#   then 
#     curl https://raw.githubusercontent.com/timkay/aws/master/aws -o aws
#     chmod u+x aws
#     ./aws put --progress "x-amz-acl: public-read" springio-guides/donnie-web-0.1.0.jar target/donnie-web-0.1.0.jar
# fi

rm -rf target

./gradlew build
ret=$?
if [ $ret -ne 0 ]; then
exit $ret
fi

rm -rf build
exit
