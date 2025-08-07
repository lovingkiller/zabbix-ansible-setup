# Zabbix Server Setup with Ansible (Ubuntu 22.04)

This project automates the installation and configuration of **Zabbix Server** using **Ansible** on Ubuntu 22.04. It installs and configures Zabbix, MariaDB, Apache, PHP, and required components in one go.

---

## 🏗  Project Structure

```bash
zabbix-ansible-setup/
├── ansible/
│   ├── playbook.yml            # Main Ansible playbook
│   ├── vars.yml                # Variable file (DB name, user, password)
│   └── templates/
│       └── zabbix.conf.php.j2  # Zabbix frontend config template






🧾 Prerequisites
Ubuntu 22.04 VM

Ansible installed on control node

SSH access to target server (example: 10.20.40.12)

Passwordless sudo for the user or become password set



🔧 Ansible Variable File: vars.yml
yaml

zabbix_db_name: "zabbix"
zabbix_db_user: "zabbix"
zabbix_db_pass: "ZabbixUserPassword"

zabbix_db_root_user: "admin"
zabbix_db_root_pass: "AdminStrongPass!"

Create this file in the ansible/ folder.



🔨 How to Run
bash

cd ansible
ansible-playbook -i <ip>, playbook.yml

Use -u <username> and --ask-become-pass if needed.


📜 What the Playbook Does

Installs Zabbix, Apache, MariaDB, PHP & dependencies

Starts & enables MariaDB

Creates zabbix database and user

Imports Zabbix schema

Places frontend config (zabbix.conf.php)

Enables Apache config and starts services



⚠️ Common Mistakes
Mistake	                                                              Fix

Tried to login MySQL as root without sudo	Use sudo mysql -u root or setup a root password
Forgot to create MariaDB user admin manually	Run sudo mysql, then create user admin@localhost
Tried importing schema before DB/user creation	Always order your tasks properly
/root/.my.cnf error	                        Set credentials explicitly in vars.yml, don't rely on .my.cnf



 After Successful Setup

Open http://<server-ip>/zabbix

Follow the web installer

DB Host: localhost

DB Name/User/Pass as per vars.yml
