## process commands

    * 'ps -ef | head -n 20' - List running processes (top 20 lines)
 <img width="880" height="470" alt="image" src="https://github.com/user-attachments/assets/909edf2b-76d3-4ae3-aa5a-4a1ffc170e2e" />

    * 'pgrep -lx dockerd' - List PID exact match to dockerd
 <img width="880" height="51" alt="image" src="https://github.com/user-attachments/assets/ccd75f4e-9979-474f-8b5d-b4fbf9a9941c" />

- Service commands
  
    - systemctl status | head -n 30  - print 30 lines from top of system status summary
 <img width="880" height="692" alt="image" src="https://github.com/user-attachments/assets/e7af7e5b-9d8b-40c8-bc8e-bc528e8b462a" />

    - systemctl list-units --type=service --state=running | head -n 10 - prints first 10 lines of running services status
 <img width="1025" height="254" alt="image" src="https://github.com/user-attachments/assets/fffbd793-d80a-4dc3-a651-061010c6cf02" />
 
- Log commands
  
    - journalctl -u docker - display logs from docker service
 <img width="1390" height="715" alt="image" src="https://github.com/user-attachments/assets/2fe2c768-8fc9-44a6-b70d-e740ad41ab0b" />
    - tail -n 40 /var/log/auth.log -Last 40 lines of auth.log 
 <img width="1390" height="715" alt="image" src="https://github.com/user-attachments/assets/9a7d662b-cb99-4aac-9133-863fb5fc3677" />

- Service of inspection(nginx)

  - systemctl status nginx - check status of nginx service
 <img width="1390" height="488" alt="image" src="https://github.com/user-attachments/assets/d9293407-f43d-47a9-ad0b-1cf6fd262eca" />
  - systemctl stop nginx - stop the service nginx
 <img width="1390" height="363" alt="image" src="https://github.com/user-attachments/assets/b6695744-8995-4a89-9944-11d9eb55f0d2" />
  - journalctl -u nginx | tail - inspect the logs for nginx service (last 10 logs)
 <img width="1390" height="252" alt="image" src="https://github.com/user-attachments/assets/270b6cb2-adce-4a1a-9fe7-da372e0774b5" />
  - sudo systemctl start nginx.service - again start the service nginx
 <img width="1390" height="578" alt="image" src="https://github.com/user-attachments/assets/8c952e90-94af-4565-87be-fd7bf9275fb5" />


