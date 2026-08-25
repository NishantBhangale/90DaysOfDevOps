# Day 15 – Networking Concepts: DNS, IP, Subnets & Ports

## Task
Build on Day 14 by understanding the building blocks of networking every DevOps engineer must know.

You will:
- Understand how **DNS** resolves names to IPs
- Learn **IP addressing** (IPv4, public vs private)
- Break down **CIDR notation** and **subnetting** basics
- Know common **ports** and why they matter

This is concept-focused — research, understand, and document in your own words.

---

## Expected Output
- A markdown file: `day-15-networking-concepts.md`

---

## Challenge Tasks

### Task 1: DNS – How Names Become IPs
1. Explain in 3–4 lines: what happens when you type `google.com` in a browser?
   
   `When you type google.com, your browser first checks its local cache for the website's IP address. If missing, it queries a DNS resolver, which searches root, TLD, and authoritative name servers to translate the human-readable domain name into a machine-readable IP address.
   Once the correct IP address is returned to your computer, your browser uses it to connect to Google's server. Computers use numbers (IP addresses) to find websites, not names like google.com. When you type the web address, your computer checks a digital phonebook called DNS to look up Google's actual number.
   The DNS system finds the correct number and sends it back to your device. Your browser then uses that number to successfully connect and load the website.`
  
3. What are these record types? Write one line each:
   - `A`, `AAAA`, `CNAME`, `MX`, `NS`
  ` A (Address): Connects a website name (like google.com) to a standard IPv4 address number.
    AAAA (IPv6 Address): Similar to an A record, but connects to a newer, longer IPv6 address number.
    CNAME (Alias): Acts like a nickname, pointing one web address to another main website (e.g., sending [www.example.com](https://www.example.com) to just example.com).
    MX (Mail Exchange): Directs emails sent to your domain to the correct mail server.
    NS (Name Server): Points to the server that actually stores and manages all these DNS records for a specific website.`  
4. Run: `dig google.com` — identify the A record and TTL from the output
   
  `  ; <<>> DiG 9.18.39-0ubuntu0.24.04.6-Ubuntu <<>> www.google.com
    ;; global options: +cmd
    ;; Got answer:
    ;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 63561
   ;; flags: qr rd ra; QUERY: 1, ANSWER: 8, AUTHORITY: 0, ADDITIONAL: 1 `

    ;; OPT PSEUDOSECTION:
    ; EDNS: version: 0, flags:; udp: 65494
    ;; QUESTION SECTION:
    ;www.google.com.                        IN      A

    ;; ANSWER SECTION:
    www.google.com.         139     IN      A       142.251.155.119
    www.google.com.         139     IN      A       142.251.150.119
    www.google.com.         139     IN      A       142.251.156.119
    www.google.com.         139     IN      A       142.251.154.119
    www.google.com.         139     IN      A       142.251.151.119
    www.google.com.         139     IN      A       142.251.153.119
    www.google.com.         139     IN      A       142.251.157.119
    www.google.com.         139     IN      A       142.251.152.119
    
    ;; Query time: 1 msec
    ;; SERVER: 127.0.0.53#53(127.0.0.53) (UDP)
    ;; WHEN: Tue Aug 25 11:51:11 UTC 2026
    ;; MSG SIZE  rcvd: 171 
    `
---

### Task 2: IP Addressing
1. What is an IPv4 address? How is it structured? (e.g., `192.168.1.10`)
   
   An IPv4 (Internet Protocol version 4) address is a unique, numerical label assigned to every device connected to a computer network that uses the Internet Protocol for communication.
   An IPv4 address is a 32-bit number typically represented in dotted-decimal notation.
    - Four Octets (Bytes): The address is divided into four parts called octets (or bytes), separated by periods (dots).
    - Decimal Range: Each octet can represent a decimal number from 0 to 255. This is because each octet consists of 8 binary bits ($2^8 = 256$ possible values, from 00000000 to 11111111).
    - Total Combinations: Across all four octets ($32$ bits), IPv4 supports approximately $4.3$ billion unique addresses ($2^{32}$).
  
3. Difference between **public** and **private** IPs — give one example of each

     - Public IP Address 
     What it is: A public IP address is assigned by Internet Service Provider (ISP) and is globally unique across the entire internet.
     It acts as home or organization's primary identifier on the web.
     Example: 8.8.8.8 (One of Google's public DNS servers)
     - Private IP Address
     What it is: A private IP address is used within a local network (like home Wi-Fi or an office LAN).
     These addresses are not routable on the public internet, meaning websites and external servers cannot see or connect to them directly.
     Who uses it: Laptops, smartphones, smart TVs, and printers connected to your local router.
     Example: 192.168.1.1 (A very common default private IP address for home routers)
     - Key Takeaway: Local device communicates with your router using a private IP (e.g., 192.168.1.50), and router communicates with the rest of the internet using a public IP provided by your ISP.
     Who uses it: Web servers, routers connecting to the outside world, and public-facing devices. Everything on the internet sees router by its public IP address.
  


4. What are the private IP ranges?
   - `10.x.x.x`, `172.16.x.x – 172.31.x.x`, `192.168.x.x`
     ## Private IP Address Ranges (RFC 1918)

| CIDR Block       | Range                           | Addresses   | Common Use          |
|-------------------|----------------------------------|-------------|----------------------|
| `10.0.0.0/8`      | 10.0.0.0 – 10.255.255.255       | 16,777,216  | Large networks       |
| `172.16.0.0/12`   | 172.16.0.0 – 172.31.255.255     | 1,048,576   | Medium networks      |
| `192.168.0.0/16`  | 192.168.0.0 – 192.168.255.255   | 65,536      | Small/home networks  |

### Additional Reserved Ranges

| CIDR Block         | Range                             | Purpose                     |
|---------------------|-------------------------------------|------------------------------|
| `127.0.0.0/8`       | 127.0.0.0 – 127.255.255.255       | Loopback                     |
| `169.254.0.0/16`    | 169.254.0.0 – 169.254.255.255     | Link-local (APIPA)           |
| `fc00::/7`          | fc00:: – fdff:ffff:...            | Unique local address (IPv6)  |
6. Run: `ip addr show` — identify which of your IPs are private

---

### Task 3: CIDR & Subnetting
1. What does `/24` mean in `192.168.1.0/24`?

`/24` in `192.168.1.0/24` indicates how many of the 32 bits in an IPv4 address are fixed as the **network portion**, leaving the rest for **host addresses**.
  
3. How many usable hosts in a `/24`? A `/16`? A `/28`?

The formula: **Usable Hosts = 2^(32 − prefix) − 2**
(subtract 2 for the network address and broadcast address)

| CIDR   | Host Bits | Total Addresses | Usable Hosts         |
|--------|-----------|------------------|------------------------|
| `/24`  | 8         | 2^8 = 256        | 256 − 2 = **254**      |
| `/16`  | 16        | 2^16 = 65,536    | 65,536 − 2 = **65,534**|
| `/28`  | 4         | 2^4 = 16         | 16 − 2 = **14**        |

Host bits = 32 - 24 = 8
Total addresses = 2^8 = 256
Usable hosts = 256 - 2 = 254
(1 reserved for network address, 1 reserved for broadcast address)

5. Explain in your own words: why do we subnet?
   Subnetting is basically about breaking a big network into smaller, manageable pieces
   ## Why Do We Subnet?

   Subnetting splits one large network into smaller, manageable pieces.
    
    | Reason              | Benefit                                              |
    |----------------------|-------------------------------------------------------|
    | **Avoid waste**      | Assign right-sized address blocks instead of one huge block |
    | **Reduce broadcasts**| Smaller broadcast domains → less unnecessary traffic  |
    | **Organization**     | Separate subnets per dept/floor/function (e.g. Finance, Guest Wi-Fi) |
    | **Security**         | Isolate segments (e.g. IoT from employee devices) with firewalls/ACLs |
    | **Routing efficiency**| Routers summarize & route smaller networks faster    |
    
    > **In short:** Subnetting turns one large, flat, insecure network into several smaller, faster, safer, and easier-to-manage ones.
7. Quick exercise — fill in:

| CIDR   | Host Bits | Total IPs | Usable Hosts         |
|--------|-----------|------------------|------------------------|
| `/24`  | 8         | 2^8 = 256        | 256 − 2 = **254**      |
| `/16`  | 16        | 2^16 = 65,536    | 65,536 − 2 = **65,534**|
| `/28`  | 4         | 2^4 = 16         | 16 − 2 = **14**        |

---

### Task 4: Ports – The Doors to Services
1. What is a port? Why do we need them?

A **port** is a numbered endpoint (0–65535) used to identify a specific process or service running on a device, alongside its IP address.

### Why We Need Ports

| Without Ports | With Ports |
|----------------|-------------|
| One IP = one running service at a time | One IP = thousands of services running simultaneously |
| No way to tell traffic apart | Each app/service gets its own "door" to send/receive data |

### Key Idea
3. Document these common ports:

```
## Common Ports Reference

| Port  | Service                     |
|-------|------------------------------|
| 22    | SSH (Secure Shell)           |
| 80    | HTTP                         |
| 443   | HTTPS                        |
| 53    | DNS (Domain Name System)     |
| 3306  | MySQL                        |
| 6379  | Redis                        |
| 27017 | MongoDB                      |
```

3. Run `ss -tulpn` — match at least 2 listening ports to their services
   ## `ss -tulpn` Output — Port to Service Mapping

| Port          | Address        | Likely Service                          |
|----------------|----------------|--------------------------------------------|
| `53`           | 127.0.0.53     | **DNS** — local stub resolver (systemd-resolved) |
| `2222`         | 0.0.0.0 / [::] | **SSH** — running on custom port (common in Codespaces/dev containers instead of 22) |

1. **Port 53 → DNS** (`127.0.0.53` is the classic systemd-resolved stub listener)
2. **Port 2222 → SSH** (non-standard port, but same purpose as port 22 — remote shell access)

---

### Task 5: Putting It Together
Answer in 2–3 lines each:
- You run `curl http://myapp.com:8080` — what networking concepts from today are involved?
  DNS resolves `myapp.com` to an IP address, then a TCP connection is made to that IP on **port 8080** (the app's service port, not the default 80).
  This shows both **name resolution** and **IP + port addressing** working together.
- Your app can't reach a database at `10.0.1.50:3306` — what would you check first?
  First check if `10.0.1.50` is even **reachable** (ping/network routing — note it's a private IP, so you must be on the same network/VPN).
  Then confirm the **port 3306 is open** (not blocked by firewall/security group) and that MySQL is actually **listening** on that host.

---

## Documentation

Create `day-15-networking-concepts.md` with:
- Your answers to each task
- Command outputs from `dig` and `ss`
- The filled CIDR table
- What you learned (3 key points)

---

## Submission
1. Add `day-15-networking-concepts.md` to `2026/day-15/`
2. Commit and push to your fork

---

## Learn in Public

Share what you learned about DNS, subnets, or ports on LinkedIn.

```
#90DaysOfDevOps #DevOpsKaJosh #TrainWithShubham
```

Happy Learning!
**TrainWithShubham**
