#!/bin/bash
sudo yum -y update
sudo yum -y install java
sudo yum install -y git
git clone https://gitee.com/uyao791_admin/aws-bankend-api.git
cd aws-bankend-api
sudo echo "spring.datasource.url=jdbc:postgresql://\$${db_endpoint}:5432/\$${db_name}
spring.datasource.driverClassName=org.postgresql.Driver
spring.datasource.username=postgres
spring.datasource.password=postgres
spring.jpa.database-platform=org.hibernate.dialect.H2Dialect
logging.level.org.hibernate.SQL=DEBUG
spring.jpa.properties.hibernate.dialect = org.hibernate.dialect.PostgreSQLDialect
logging.level.org.hibernate.type.descriptor.sql.BasicBinder=TRACE" > application.properties

sudo amazon-linux-extras install docker
sudo service docker start
sudo usermod -a -G docker ec2-user
sudo docker build -t springdocker .
sudo docker run -p 80:8080 springdocker -v /home/ec2-user/aws-bankend-api:/data/java/config -d

