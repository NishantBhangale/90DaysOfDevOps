# The core components of Linux
- Hardware : The physical component including processor, ram, storage etc where OS is installed
- Kernel → Manages hardware, memory, processes
- Shell → Interface to interact with system (bash)
- File System → Organizes files (/home, /etc, etc.)
- System Libraries → Help apps talk to kernel
- Utilities & Applications → Commands and tools (ls, grep, etc.)

# Processes in Linux
A process is a running instance of a program
Eg:
- Running firefox → creates a process
- Running nginx server → background process

# Process States
- Running (R) → Currently executing
- Sleeping (S) → Waiting for input or Idle process
- Stopped (T) → Process suspended by signal SIGSTOP (Ctrl+Z, Ctrl+C). It can be resumed by a SIGCONT signal
- Zombie (Z) → The process has terminated, but its entry in the process table still exists because its parent process has not yet read its exit status.
- Dead (X) → Terminated

# 5 Daily Linux Commands
- ls
→ Lists files and directories

- cd
→ Changes directory

- pwd
→ Shows current directory

- cp
→ Copies files

- grep
→ Searches text inside files

# Systemd commands
- systemctl start nginx
- systemctl stop nginx
- systemctl restart nginx
- systemctl reload nginx
