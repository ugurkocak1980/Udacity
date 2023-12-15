#!/bin/bash
# Install docker
    apt-get update
    apt-get install -y apt-transport-https ca-certificates curl software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"
    apt-get update
    apt-get install -y docker-ce
    usermod -aG docker ubuntu
    docker run -p 8080:8080 tomcat:8.0


#!/bin/bash
apt-get update -y
apt-get install apache2 -y
systemctl start apache2.service
cd /var/www/html
echo "Udacity Demo Web Server Up and Running!" > index.html        


#!/bin/bash
yum update -y
yum install -y httpd
sed -i 's/Listen 80/Listen 8080/' /etc/httpd/conf/httpd.conf
systemctl start httpd
systemctl enable httpd


UserData: # Script that will run on the new instance automatically after launch
# script will first install the Apache Tomcat server, starting the server, and then create an index.html page at the default location, /var/www/html.
Fn::Base64: !Sub |
#!/bin/bash
yum update -y
yum install -y httpd
sed -i 's/Listen 80/Listen 8080/' /etc/httpd/conf/httpd.conf
systemctl start httpd
systemctl enable httpd      
cd /var/www/html
sudo chown ec2-user html/
echo "Udacity Demo Web Server Up and Running!" > index.html     


Fn::Base64: !Sub |
    #!/bin/bash
        apt-get update -y
        apt-get install unzip awscli -y
        apt-get install apache2 -y
        systemctl start apache2.service
        cd /var/www/html
        aws s3 cp s3://your-bucket-address/udacity.zip .
        unzip -o udacity.zip

#aws s3 cp s3://udacity-demo-1/udacity.zip

UserData: 
    Fn::Base64: !Sub |
        #!/bin/bash -xe
        exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1
        apt update -y
        apt install -y apache2
        systemctl start apache2
        systemctl enable apache2
        rm ../../var/www/html/index.html
        wget -P ../../var/www/html https://s3.us-east-2.amazonaws.com/test-udagram-1/index.html


        aws s3api get-object --bucket ugurkocakbucket --key udacity.zip udacity.zip --region eu-central-1




Fn::Base64: !Sub |
    #!/bin/bash
    yum update -y
    yum install -y httpd
    sed -i 's/Listen 80/Listen 8080/' /etc/httpd/conf/httpd.conf
    systemctl start httpd
    systemctl enable httpd      
    cd /var/www/html
    sudo chown ec2-user html/
    echo "Udacity Demo Web Server Up and Running!" > index.html   


    Fn::Base64: !Sub |
        #!/bin/bash
        yum update -y
        yum install -y httpd
        sed -i 's/Listen 80/Listen 8080/' /etc/httpd/conf/httpd.conf
        systemctl start httpd
        systemctl enable httpd      
        cd /var/www
        sudo chown ec2-user html/
        cd html
        wget https://ugurkocakbucket.s3.eu-central-1.amazonaws.com/udacity.zip
        unzip udacity.zip
        rm udacity.zip               


 Fn::Base64: !Sub |
    #!/bin/bash
    yum update -y
    yum install -y httpd
    sed -i 's/Listen 80/Listen 8080/' /etc/httpd/conf/httpd.conf
    systemctl start httpd
    systemctl enable httpd      
    cd /var/www
    sudo chown ec2-user html/
    cd html
    wget https://ugurkocakbucket.s3.eu-central-1.amazonaws.com/udacity.zip
    unzip udacity.zip
    rm udacity.zip 

sudo apt-get update -y
sudo apt-get install apache2 -y
sudo systemctl start apache2.service
cd /var/www/
sudo chown ubuntu html/*
cd html/
sudo echo "WellDone ! Udacity Demo Web Server Up and Running!" > index.html