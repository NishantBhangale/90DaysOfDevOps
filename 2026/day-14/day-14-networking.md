# Networking Fundamentals & Hands-on Checks

## OSI and TCP/IP Model

### OSI Model - 
OSI is a conceptual model that defines network communication. It consists of 7 layers where each layer performs a specific function.
* **Application L7** - Where the user interacts with the network. Protocols: HTTP, HTTPS, FTP, DNS, SMTP. Example: your browser requesting a webpage.
* **Presentation L6** - Handles data formatting, encryption/decryption, and compression. Example: SSL/TLS encryption, JPEG/PNG encoding.
* **Session L5** - Establishes, manages, and terminates sessions between two devices. Example: maintaining a login session while you browse a site.
* **Transport L4** - Ensures reliable (or fast) delivery of data. Protocols: TCP (reliable, ordered) and UDP (fast, no guarantee). Example: TCP handshakes, port numbers.
* **Netwrok L3** - Handles logical addressing and routing between different networks. Protocols: IP, ICMP. Example: how your packet finds its way from your laptop to a server across the internet.
* **Data Link L2** - Handles node-to-node data transfer within the same network, using MAC addresses. Protocols: Ethernet, ARP, switches operate here.
* **Physical L1** - The actual physical medium — cables, radio waves, voltages, connectors. Example: Ethernet cables, fiber optics, Wi-Fi signals.

### TCP/IP Model - 
TCP/IP is practically used for providing communication between computers over the internet.

* **Application L4** - Combines OSI’s Application + Presentation + Session. 
* **Transport L3** - Same as OSI Transport.
* **Internet L2** - Same as OSI Network.
* **Netwrok access L1** - Physical + Data Link combined.

### Protocol Placement

* **HTTP, HTTPS, FTP, SMTP, DNS, DHCP, SSH** - Application layer
* **TCP, UDP** - Transport Layer
* **IP, ICMP, ARP** - Network Layer
* **Ethernet, Wi-Fi** - Physical layer

### Real Example

<img width="1872" height="588" alt="image" src="https://github.com/user-attachments/assets/557ee3c1-836d-4b5a-a558-24bd0df2d1c6" />

→ HTTP (Application) over TCP (Transport) over IP (Internet)

## Hands-on Checklist

* Identity : `hostname -I`

 **Observation:** Local private IP address is 10.84.212.222
 
<img width="951" height="79" alt="image" src="https://github.com/user-attachments/assets/60ab2974-43e0-4fc6-a3fd-30666c50766d" />

* Reachability: `ping <target>`

 **Observation:** 0% packet loss with 4006ms average latency confirms good network connectivity.
 
<img width="951" height="383" alt="image" src="https://github.com/user-attachments/assets/2a81002a-fce2-417b-8785-366cae02612d" />

* Path: `traceroute <target>`

 **Observation:** 30 hops max with 80.629 ms latency.
  Longer latency at hop 2 compared to others.
  
<img width="1349" height="453" alt="image" src="https://github.com/user-attachments/assets/d78ebad9-c11c-47ed-811b-a33913c22e83" />

* Ports: `ss -tulpn` , `netstat -tulpn` or `netstat -tulpn | grep 80`

 **Observation:** Service - ssh. SSH is listening on port 22.
 
<img width="1349" height="127" alt="image" src="https://github.com/user-attachments/assets/c59309ee-fd7d-4546-b9f4-e004ec09de37" />

* Name resolution: `dig <domain>` or `nslookup <domain>`

 **Observation:** Domain resolves to 142.250.70.100.
 
<img width="879" height="1005" alt="image" src="https://github.com/user-attachments/assets/13065d26-5dae-4b5c-961a-e9234610b367" />
<img width="879" height="828" alt="image" src="https://github.com/user-attachments/assets/eabb406c-df44-4072-828a-db11518f8791" />

* HTTP check: `curl -I <http/https-url>`

 **Observation:** Received response HTTP/1.1 200 OK. Server successfully responded and the resource is available.
 
<img width="1869" height="452" alt="image" src="https://github.com/user-attachments/assets/0f86a677-84da-48dc-bbf0-73c365eb9e0a" />

* Connections snapshot: `netstat -an | head`

 **Observation:** LISTEN: 5 entries (ports 631, 7071, 53, 54, 22).
 ESTABLISHED: 3 entries (all HTTPS connections).
 
<img width="1869" height="286" alt="image" src="https://github.com/user-attachments/assets/f0af839e-5492-47c0-9f89-3aad8553c43e" />

## Mini Task: Port Probe & Interpret

- SSH service on port 22

<img width="1869" height="127" alt="image" src="https://github.com/user-attachments/assets/bca23724-78ff-426b-9849-a687706e41b4" />

- Connection succeeded

<img width="675" height="83" alt="image" src="https://github.com/user-attachments/assets/46ed2497-ef27-4c54-bd8d-0e8d96779ac0" />

**If not reachable :** 
- Check service status - `systemctl status ssh`
- Check logs - `journlctl -u ssh`
- Check firewall - `sudo ufw status`

## Reflection

- **Ping** command gives fastest signal if something is broken.
- DNS fails : It runs on application layer if DNS queries don’t resolve, the next logical layer to inspect is 
  the Transport layer (L4) and Internet layer (L3)
  
  -> dig, nslookup, ping, ss -tulpn
- HTTP 500 : It is application layer. Since you got response(500) it means internet and transport layers are fine.
  Check at Application layer.
  
  -> systemctl status service, journalctl -u service, tail -f /var/log/service/error.log
- Follow up checks in real incident :
    * Check firewall (`sudo ufw status`,`sudo iptables -L -n -v`)
    * Service helth check (`systemctl status <service>`)
    * Connectivity test (`curl -I http://<server-ip>:<port>`,`nc -zv <server-ip> <port>`)
