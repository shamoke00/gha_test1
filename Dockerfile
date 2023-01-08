# Container image that runs your code
FROM gcc:latest

# Copies your code file from your action repository to the filesystem path `/` of the container
#COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
#ENTRYPOINT ["/entrypoint.sh"]


# Copy repo into container and set working directory
COPY . /usr/src/myapp
WORKDIR /usr/src/myapp

#build using make
#RUN gcc -o myapp main.c
RUN make

#check for main fle
RUN ls -la && chmod +x main && ls -la


#run main directly
#RUN main

# Run app
CMD ["./main"]
