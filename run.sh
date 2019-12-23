echo "Running Hello"
docker run -it --rm --entrypoint ./hello boost-python:latest

echo "Running Sklearn"
docker run -it --rm --entrypoint ./hello-sklearn boost-python:latest
