docker build -f ./docker/rest/Dockerfile.rest -t generic-rest-driver-image .
docker run -v .:/app generic-rest-driver-image