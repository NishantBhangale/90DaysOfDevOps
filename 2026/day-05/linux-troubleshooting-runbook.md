# RUNBOOK for docker service

### This runbook provides quick troubleshooting steps if the docker service goes down.

## Environment basics

* Command : `uname -a`

  Output : `Linux nishant-linux 6.17.0-35-generic #35~24.04.1-Ubuntu SMP PREEMPT_DYNAMIC Tue May 26 19:30:42 UTC 2 x86_64 x86_64 x86_64 GNU/Linux`

  Observation : Platform, Hostname, Kernel version and architecture confirmed.

* Command : `cat /etc/os-release`

  Output : `PRETTY_NAME="Ubuntu 24.04.4 LTS"
            NAME="Ubuntu"
            VERSION_ID="24.04"
            VERSION="24.04.4 LTS (Noble Numbat)"
            VERSION_CODENAME=noble
            ID=ubuntu
            ID_LIKE=debian
            HOME_URL="https://www.ubuntu.com/"
            SUPPORT_URL="https://help.ubuntu.com/"
            BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
            PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
            UBUNTU_CODENAME=noble
            LOGO=ubuntu-logo`
          
  Observation : Confirms distribution and release version.

## Filesystem sanity

* Command : `mkdir /tmp/runbook-demo`
  
  Observation : Directory created successfully.

* Command : `cp /etc/hosts /tmp/runbook-demo/copy_hosts && ls -l /tmp/runbook-demo`
  
  Observation : Copied the files from /etc/hosts. Filesystem is writable.
                `-rw-r--r-- 1 nishant nishant 228 Jun 12 07:44 copy_hosts`  

## CPU / Memory 

* Command : `ps -o pid,pcpu,pmem,comm -p $(pidof dockerd)`

  Output : `PID %CPU %MEM COMMAND`
           `3012  0.0  0.2 dockerd`

  Observation : Process running and CPU & Memory usage is negligible.

* Command : `free -h`

  Output : `               total        used        free      shared  buff/cache   available
            Mem:            15Gi        10Gi       715Mi       601Mi       4.8Gi       4.9Gi
            Swap:          4.0Gi       1.3Gi       2.7Gi`
  
  Observation : Sufficient memory available.
  
## Disk / IO 

* Command : `df -h`

  Output : `/dev/sda1       457G   81G  353G  19% /`
  
  Observation : Root partition more than 80% available.

* Command : `iostat`
  
  Observation : CPU idle= 92.63.01% -> which is healthy.
                iowait= 0.08% -> small percentage of CPU time waiting for I/O.
                system= 1.75% -> low.
                user= 5.32% -? about 10% CPU time is spent on user processes.
  
## Network

* Command : `sudo ss -tulpn | grep  sshd`

  Output : `tcp   LISTEN 0      4096         0.0.0.0:2375         0.0.0.0:*    users:(("dockerd",pid=1234,fd=7)`
  
  Observation : docker is listening on port 2375.

* Command : `nc -zv localhost 2375`

  Output : `Connection to localhost (127.0.0.1) 2375 succeeded!`
  
  Observation : Connection confirmed.
 
## Logs

* Command : `journalctl -u docker | tail -n 10`
  
  Observation : Last 10 lines shows normal conatainer start restarts activities.

* Command :`docker logs <container name> `
  
  Observation : Recent login attempts record.
  

## Quick review
- docker service running normally
- Disk and logs size is healthy
- Network port 2375 is open and serving connections.
- No errors in logs.

## If this worsens
- Check logs again 
- Check CPU usage/Disk usage
- Restart service
- Check if port is used by other service
