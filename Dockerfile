# Set the base image to Ubuntu
FROM ubuntu

# File Author / Maintainer
MAINTAINER Andrew Udell

# Add the application resources URL
RUN echo "deb http://archive.ubuntu.com/ubuntu/ $(lsb_release -sc) main universe" >> /etc/apt/sources.list

# Update the sources list
RUN apt-get update

# Install basic applications
RUN apt-get install -y tar git curl nano wget dialog net-tools build-essential

# Install Python and Basic Python Tools
RUN apt-get install -y python python-dev python-distribute python-pip

# Copy the application folder inside the container
ADD . /my_application

# Set the default directory where CMD will execute
WORKDIR /my_application

# Expose ports
EXPOSE 5000

# Get pip to download and install requirements:
RUN pip install -r /my_application/requirements.txt

# Set the command to be run when the container is run.
CMD python app.py



