# 🚀 Ubuntu LAMP Stack Installer

<div align="center">
  <img src="https://user-images.githubusercontent.com/shahedfardous/lamp-installer/banner.svg" alt="LAMP Stack" width="800">

  [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
  [![Ubuntu 22.04](https://img.shields.io/badge/Ubuntu-22.04-E95420?logo=ubuntu&logoColor=white)](https://ubuntu.com/)
  ![Bash](https://img.shields.io/badge/Bash-4.4%2B-4EAA25?logo=gnu-bash&logoColor=white)
</div>

## 🚀 One-Line Installation
```bash
curl -sSL https://raw.githubusercontent.com/shahedfardous/lamp-installer/master/install_lamp.sh | sudo bash
```

## 📖 Overview

Quick and secure LAMP stack installer for Ubuntu 22.04 LTS or Later Versions [ also on any debian based distros].

Sets up:
- 🐧 **Linux** (Ubuntu 22.04)
- 🌐 **Apache** (Latest version)
- 🗄️ **MySQL** (8.0+)
- 🐘 **PHP** (8.1+)

## ✨ Features

| Component | Features |
|-----------|----------|
| Apache | - SSL Support<br>- ModRewrite<br>- Optimal Configs |
| MySQL | - Secure Installation<br>- Performance Tuning<br>- Root Password Setup |
| PHP | - Latest Stable<br>- Common Extensions<br>- Security Configs |

## 🔧 What's Installed

<details>
<summary>Click to expand installed components</summary>

### Apache Modules
- mod_rewrite
- mod_ssl
- mod_security

### PHP Extensions
- php-mysql
- php-curl
- php-gd
- php-mbstring
- php-xml
- php-json
- php-zip

### MySQL Configuration
- Secure defaults
- InnoDB optimizations
- Performance settings
</details>

## 🚦 Requirements

- Ubuntu 22.04 LTS or Later Versions [ also on any debian based distros]
- Root/Sudo access
- 1GB+ RAM
- 2GB+ free disk space
- Active internet connection

## 📝 Usage

### 1. Quick Install (Recommended)
```bash
curl -sSL https://raw.githubusercontent.com/shahedfardous/lamp-installer/master/install_lamp.sh | sudo bash
```

### 2. Manual Installation
```bash
git clone https://github.com/shahedfardous/lamp-installer.git
cd lamp-installer
chmod +x install_lamp.sh
sudo ./install_lamp.sh
```

## ⚙️ Default Paths

```plaintext
📂 Document Root: /var/www/html/
📂 Apache Config: /etc/apache2/apache2.conf
📂 PHP Config:    /etc/php/8.1/apache2/php.ini
📂 MySQL Config:  /etc/mysql/mysql.conf.d/mysqld.cnf
```

## 🔍 Verification Steps

1. Check Apache:
```bash
http://your_server_ip
```

2. Verify PHP:
```bash
http://your_server_ip/info.php
```

3. Test MySQL:
```bash
mysql -u root -p
```

## 🛡️ Security Checklist

✅ Remove info.php:
```bash
sudo rm /var/www/html/info.php
```

✅ Configure Firewall:
```bash
sudo ufw enable
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
```

✅ Secure MySQL:
```bash
sudo mysql_secure_installation
```

## 🐛 Troubleshooting

| Issue | Solution |
|-------|----------|
| Apache not starting | `sudo systemctl status apache2` |
| MySQL connection failed | Check `/var/log/mysql/error.log` |
| PHP modules missing | `sudo apt install php-[module_name]` |

## 🤝 Contributing

1. Fork the repo
2. Create feature branch
   ```bash
   git checkout -b feature/amazing-feature
   ```
3. Commit changes
   ```bash
   git commit -m 'Add amazing feature'
   ```
4. Push to branch
   ```bash
   git push origin feature/amazing-feature
   ```
5. Open Pull Request

## 📄 License

MIT License - See [LICENSE](LICENSE) for details

## 📬 Support

- 📧 Email: shahed.fardous26@gmail.com
- 🐛 Issues: [GitHub Issues](https://github.com/shahedfardous/lamp-installer/issues)
- 💬 Discussions: [GitHub Discussions](https://github.com/shahedfardous/lamp-installer/discussions)

## 🙏 Acknowledgments

- [Apache Documentation](https://httpd.apache.org/docs/)
- [MySQL Documentation](https://dev.mysql.com/doc/)
- [PHP Documentation](https://www.php.net/docs.php)
- [Ubuntu Documentation](https://help.ubuntu.com/)

---
<div align="center">
Made with ❤️ by <a href="https://github.com/shahedfardous">Md Shahed Fardous (Samy)</a>
</div>