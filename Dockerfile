FROM ubuntu:latest
ARG DEBIAN_FRONTEND=noninteractive # ignore user input required
# Install required build dependencies
RUN apt-get -y update && apt-get install -y
RUN apt-get -y install g++ cmake git
COPY . .
WORKDIR C:\Users\mithu\.jenkins\workspace\Git_test\
# Run cmake configure & build process
RUN mkdir ./build
RUN cmake -B/build -S . -D CMAKE_BUILD_TYPE=Release
RUN cmake --build /build
# Launch built application
CMD ["./build/cppdocker_run"]