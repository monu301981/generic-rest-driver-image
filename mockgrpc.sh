docker build -f ./docker/grpc/Dockerfile.grpc -t generic-grpc-driver-image .
docker run -v .:/app generic-grpc-driver-image