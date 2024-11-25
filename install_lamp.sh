#!/bin/bash

# LAMP Stack Installation Script for Ubuntu 22.04 LTS or Later Versions [ also on any debian based distros]
# This script must be run with sudo privileges

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print colored messages
print_message() {
    echo -e "${GREEN}[*] $1${NC}"
}

print_error() {
    echo -e "${RED}[-] $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}[!] $1${NC}"
}

# Check if script is run as root
if [[ $EUID -ne 0 ]]; then
    print_error "This script must be run as root. Please use sudo."
    exit 1
fi

# Function to check the success of the last command
check_status() {
    if [ $? -eq 0 ]; then
        print_message "$1 successful"
    else
        print_error "$1 failed"
        exit 1
    fi
}

# Update system
print_message "Updating system packages..."
apt update && apt upgrade -y
check_status "System update"

# Install Apache
print_message "Installing Apache web server..."
apt install apache2 -y
check_status "Apache installation"

# Enable Apache modules
print_message "Enabling Apache modules..."
a2enmod rewrite
a2enmod ssl
systemctl restart apache2
check_status "Apache module configuration"

# Install MySQL
print_message "Installing MySQL server..."
apt install mysql-server -y
check_status "MySQL installation"

# Secure MySQL installation
print_message "Securing MySQL installation..."
print_warning "You will be prompted to set up MySQL security options"
mysql_secure_installation
check_status "MySQL security configuration"

# Install PHP and common modules
print_message "Installing PHP and common modules..."
apt install php libapache2-mod-php php-mysql php-common php-cli php-json php-curl php-zip php-gd php-mbstring php-xml php-xmlrpc php-soap -y
check_status "PHP installation"

# Create info.php file
print_message "Creating PHP info file..."
echo "<?php phpinfo(); ?>" > /var/www/html/info.php
check_status "PHP info file creation"

# Set correct permissions
print_message "Setting correct permissions..."
chown -R www-data:www-data /var/www/html/
chmod -R 755 /var/www/html/
check_status "Permission configuration"

# Configure PHP
print_message "Configuring PHP..."
php_config_file="/etc/php/$(php -r 'echo PHP_MAJOR_VERSION.".".PHP_MINOR_VERSION;')/apache2/php.ini"
sed -i 's/memory_limit = .*/memory_limit = 256M/' $php_config_file
sed -i 's/upload_max_filesize = .*/upload_max_filesize = 64M/' $php_config_file
sed -i 's/post_max_size = .*/post_max_size = 64M/' $php_config_file
check_status "PHP configuration"

# Restart Apache
print_message "Restarting Apache..."
systemctl restart apache2
check_status "Apache restart"

# Display installed versions
print_message "Installation completed! Here are the installed versions:"
echo "-----------------------------------"
echo "Apache version:"
apache2 -v | head -n1
echo "-----------------------------------"
echo "MySQL version:"
mysql --version
echo "-----------------------------------"
echo "PHP version:"
php -v | head -n1
echo "-----------------------------------"

# Get server IP address
SERVER_IP=$(hostname -I | awk '{print $1}')

# Final instructions
echo ""
print_message "LAMP Stack has been successfully installed!"
echo ""
print_warning "Important next steps:"
echo "1. Access your web server: http://$SERVER_IP"
echo "2. Check PHP info: http://$SERVER_IP/info.php"
echo "3. Remove info.php file after testing: sudo rm /var/www/html/info.php"
echo "4. Default web root: /var/www/html/"
echo "5. MySQL root password should be set using: sudo mysql"
echo ""
print_warning "Security recommendations:"
echo "1. Configure UFW firewall"
echo "2. Install and configure SSL certificate"
echo "3. Remove info.php file after testing"
echo "4. Regularly update packages with: sudo apt update && sudo apt upgrade"
echo ""
print_message "Thank you for using this script!"