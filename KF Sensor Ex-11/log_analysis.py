import csv
from collections import Counter

sample_events = [
    {"Source IP": "185.234.1.22", "Protocol": "SSH"},
    {"Source IP": "103.21.5.88", "Protocol": "FTP"},
    {"Source IP": "45.142.3.7", "Protocol": "HTTP"},
    {"Source IP": "91.108.9.15", "Protocol": "MySQL"},
    {"Source IP": "172.58.4.3", "Protocol": "SMTP"},
    {"Source IP": "185.234.1.22", "Protocol": "SSH"},
    {"Source IP": "185.234.1.22", "Protocol": "SSH"},
    {"Source IP": "103.21.5.88", "Protocol": "HTTP"},
    {"Source IP": "45.142.3.7", "Protocol": "HTTP"},
    {"Source IP": "185.234.1.22", "Protocol": "FTP"},
]

events = sample_events
print(f"Total Events Logged: {len(events)}")

src_ips = [e["Source IP"] for e in events]
top_ips = Counter(src_ips).most_common(5)
print("\nTop 5 Attacker IPs:")
for ip, count in top_ips:
    print(f"  {ip:20s} : {count} attempts")

protocols = [e["Protocol"] for e in events]
top_protocols = Counter(protocols).most_common()
print("\nMost Targeted Services:")
for proto, count in top_protocols:
    print(f"  {proto:10s} : {count} connections")
