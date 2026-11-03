import socket
import datetime

HONEYPOT_IP = "127.0.0.1"
PORTS = [21, 22, 23, 25, 80, 110, 3306]

print(f"Testing honeypot at {HONEYPOT_IP}")
print(f"Time: {datetime.datetime.now()}")
print("-" * 40)

for port in PORTS:
    try:
        s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        s.settimeout(2)
        result = s.connect_ex((HONEYPOT_IP, port))
        if result == 0:
            try:
                banner = s.recv(1024).decode(errors="ignore").strip()
            except Exception:
                banner = "(no banner)"
            print(f"Port {port:5d}: OPEN  | Banner: {banner[:40]}")
        else:
            print(f"Port {port:5d}: CLOSED")
        s.close()
    except Exception as e:
        print(f"Port {port:5d}: Error - {e}")
