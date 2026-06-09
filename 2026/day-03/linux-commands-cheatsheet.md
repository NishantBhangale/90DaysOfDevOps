- Process management commands
  * ps -ef / ps aux : Shows every process running on the system with detailed PID, user/CPU/memory info
  * htop : modern and interactiver version of top, kill processes directly from the interface using your mouse or keyboard shortcuts.
  * pstree: Displays running processes as a tree diagram, showing the parent-child relationships between them.
  * kill -9 PID : Force Kill the process
  * & : Adding this to the end of the command runs the command in the background
  * jobs : Lists all tasks currently running or paused in the background of your current terminal session.
  * nice : Run the process with priorities mentioned.
    eg: nice -n 10 backup_script.sh -- Runs it with lower priority so it doesn't slow down system

- File system
   * ls : List all the files
   * ls -l : List all the file along with all details like permissions, owners and the date it was last modified.
   * cd : Change directory
   * mkdir : Create directory
   * cp : Copy files from source to destination
   * mv : move / rename files from source to destination
   * rm : delete the file

 - Networking troubleshooting
   * ip addr : show all network interfaces
   * ip address show : The command to show your IP address
   * ping: Tests basic reachability and measures latency (round-trip time)
   * dig : (Domain Information Grouper) queries DNS servers directly to see how a domain name resolves.Troubleshoots DNS lookup issues.
   * traceroute : Tracks the path of network packets to a website. If a connection fails halfway, traceroute shows you exactly which router or "hop" broke the chain.
   * nmap : (Network Mapper & Port Scanner) is a powerful security tool used to discover hosts and services on a computer network.
