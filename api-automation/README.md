
# 📡 Zabbix API Automation with Ansible

This module extends your Zabbix setup project to dynamically create **host groups**, **hosts**, and **link templates** using the Zabbix API via **Ansible**.

---

## 📂 Directory Structure

```bash
api-automation/
├── add_host.yml           # Main playbook to add hosts & host groups
├── group_vars/
│   └── all.yml            # API URL, credentials, group/template details
├── hosts.csv              # CSV file with bulk host details
└── README.md              # This file
```

---

## 🚀 What This Playbook Does

1. Authenticates to Zabbix API and gets token.
2. Creates a host group if it doesn't exist.
3. Loops over CSV file entries or YAML to:
   - Create hosts.
   - Assign to group.
   - Link to templates.

---

## 🔧 Configuration

### group_vars/all.yml

```yaml
zabbix_api_url: "http://<zabbix-server>/zabbix/api_jsonrpc.php"
zabbix_user: "Admin"
zabbix_password: "zabbix"

host_group_name: "Linux Servers"
template_name: "Template OS Linux"
```

Update the API URL and credentials as per your setup.

---

## 📑 Bulk Host Input

Edit the `hosts.csv` file:

```csv
hostname,ip
linux-node-01,10.20.40.101
linux-node-02,10.20.40.102
linux-node-03,10.20.40.103
```

---

## ▶️ How to Run

```bash
cd api-automation
ansible-playbook add_host.yml
```

Ensure that you have passwordless access or use `--ask-become-pass` if needed.

---

## 🧪 Testing Tips

- Start with 1–2 hosts from CSV.
- Confirm in Zabbix UI → Configuration → Hosts.
- Use `debug` statements in playbook to log API responses if errors occur.

---

## 🛠 Future Enhancements

- Auto-fetch template/group ID if name mismatch.
- Support for multiple templates per host.
- Error log reporting and retries.
