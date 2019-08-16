### Summary

Docker container for Moto Server.
Moto Server is a standalone server mode of the Moto library, that can be used to mock AWS services.

### Stack

* Python 3.7
* Flask

### Getting the image

    docker pull picadoh/motocker

### Running AWS services using Motocker

    docker run --name s3 -d -e MOTO_SERVICE=s3 -p 5001:5000 -i picadoh/motocker

### Enviornment variables

    MOTO_SERVICE: The AWS service to run within Moto Server (e.g. s3, ec2, etc)
    MOTO_HOST: The host to advertise for listeners
    MOTO_PORT: The port to advertise for listeners

### Accessing example

If using S3 service, browse ```http://localhost:5001/<bucket_name>/<object_name>``` for accessing the object inside a bucket.

### Example with docker-compose

    version: '3'

    s3:
      image: picadoh/motocker
      environment:
        - MOTO_SERVICE=s3
        - MOTO_HOST=10.0.1.0
      ports:
        - "5000:5000"
      networks:
        motonet:
          ipv4_address: 10.0.1.0

    networks:                             
      motonet:                          
        driver: bridge                
        ipam:                         
          config:                       
            - subnet: 10.0.0.0/16   

