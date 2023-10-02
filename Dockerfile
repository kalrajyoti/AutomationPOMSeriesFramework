FROM bellsoft/liberica-openjdk-alpine:17.0.8

# Install curl jq
RUN apk add curl jq

# workspace
WORKDIR /home/selenium-docker

# Add the required files
ADD target/docker-resources ./


# Start the runner.sh
ENTRYPOINT  java -cp 'libs/*' org.testng.TestNG testrunners/testng_regression.xml

