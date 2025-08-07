📅 15-Day Zabbix Mastery Plan
🔹 Day 1–2: Zabbix Fundamentals + Installation
What is Zabbix? Architecture: server, proxy, agent

Install Zabbix server + frontend on Ubuntu/CentOS

Configure MySQL/PostgreSQL, Apache/Nginx

Access Zabbix Web UI

📘 Resources:

Zabbix official documentation

YouTube: "Zabbix 6 Installation Step-by-Step"

🔹 Day 3–4: Host & Agent Setup
Install Zabbix Agent (on local/remote machines)

Active vs Passive agents

Add Linux and Windows hosts to monitor

Understand zabbix_get, zabbix_sender

🔹 Day 5–6: Monitoring Core Metrics
CPU, Memory, Disk, Network

File system usage

Service availability

Use built-in templates

🛠️ Task:

Apply Linux Template

Configure custom key monitoring (e.g., check disk I/O)

🔹 Day 7–8: Triggers, Items & Events
Create custom items

Write trigger expressions (last(), avg(), etc.)

Link triggers to hosts/templates

Explore event handling

🔹 Day 9–10: Alerting & Actions
Configure Email, Telegram, or Slack alerts

Set escalation levels

Use Maintenance mode

Media types & action conditions

🔹 Day 11–12: Advanced Monitoring
Low-level discovery (LLD) for disks, network interfaces

Web scenario monitoring

SNMP devices

Proxies (for remote networks)

🔹 Day 13–14: Automation & Ansible
Write Ansible playbooks to:

Install Zabbix server/agent

Configure hosts

Apply templates automatically

API usage: auto-register hosts, pull data

🛠️ Task:

Automate full stack: VM → agent → add to Zabbix → apply template → alerting

🔹 Day 15: Final Project + Optimization
Create a dashboard for:

CPU/memory trends

Top hosts by CPU load

Optimize DB cleanup, housekeeping

Prepare documentation for your GitHub


