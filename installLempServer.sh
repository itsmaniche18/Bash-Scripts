#Nginx
echo "Installing Nginx-More"
yum -y install https://repo.aerisnetwork.com/pub/aeris-release-7.rpm
yum install nginx-more -y
systemctl enable nginx
echo "Installed Nginx-More"



#PHP
echo "Installing PHP"
yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm -y
yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm -y 
yum install yum-utils -y
yum-config-manager --enable remi-php71 -y
yum install php71 php71-php-mcrypt php71-php-cli php71-php-gd php71-php-curl php71-php-mysql php71-php-ldap php71-php-zip php71-php-fileinfo php71-php-json php71-php-mysqlnd php71-php-opcache php71-php-common php71-php-zip php71-php-fpm php71-php-soap php71-php-pdo php71-php-bcmath php71-php-mbstring php71-php-tcpdf php71-php-xml -y
systemctl enable 
php71 -v
echo "Installed PHP"

#DB
echo "Installing MySql"
yum install wget
wget http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm 
rpm -ivh mysql-community-release-el7-5.noarch.rpm
yum install mysql-server -y
systemctl start mysqld
systemctl enable mysqld
echo "Installed MySql"






