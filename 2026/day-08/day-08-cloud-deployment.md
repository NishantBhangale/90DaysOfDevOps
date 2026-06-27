# Deploy a Real Web Server on the Cloud

Step 1 : Launch an instance from AWS console.

Step 2 : Connect to instance using ssh.
    
Command : `ssh -i "Nishant_Linux2.pem" ubuntu@13.127.212.76`

Step 3 : Install Nginx

Command : `sudo apt update`

`sudo apt install nginx`
        
Step 3 : Configure security groups for web access.
    From the AWS console, go to the security group and add an inbound rule for port 80 (default for Nginx).
    Status check for Nginx Service

command : `systemctl status nginx`
    
Step 4 : Check logs of nginx service and save to nginx-logs.txt

Command : `journalctl -u nginx > nginx-logs.txt`

<img width="1327" height="270" alt="Screenshot from 2026-06-28 00-23-08" src="https://github.com/user-attachments/assets/2e3e1ef6-25bf-4752-aa49-3e7133adba2d" />


Step 5 : Copy to local server

Commad : `scp -i /home/nishant/.ssh/id_ed25519 ubuntu@13.127.212.76:/home/ubuntu/nginx-logs.txt /home/nishant/Downloads/`

<img width="1383" height="119" alt="Screenshot from 2026-06-28 00-23-24" src="https://github.com/user-attachments/assets/f72fed7d-81b9-427f-8c57-d69b7be6be97" />
    
## Install Docker

Command `sudo apt-get install docker.io`
    
# Challenges Faced

* Unable to access Nginx using the public IP.

 Solution: I forgot to add port 80 to the security group inbound rules. Once added, Nginx became accessible.

# What I Learned

* Connect to an AWS cloud instance using SSH.

* How to manage security group (adding inbound rules)

* How to install Nginx and serve a webpage.

* The importance of reloading a service after configuration changes or adding new files.

* How to transfer files securely from the instance to the local machine using scp.
