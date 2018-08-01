# was-liberty-dockerimage-openjdk 
Docker image for Websphere Liberty with opendk

It is to create Docker image for Websphere Liberty using open-jdk.
Create a folder installerand copy the licensed liberty installer in zip.
Copy the Server.xml for the default Server setting .
Then run the Docker file with docker build -t <abhishek(namespace)/image:tag> . to create custom docker image.

I am using centos latest image as base image, but this docker file can be used for any yum supported OS with connectivity to public docker hub repository or else a local copy of centos on the build machine.

For installer downloads , Please go th IBM official website)
