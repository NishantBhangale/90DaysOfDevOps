- Process management commands
  * ps -ef / ps aux : Shows every process running on the system with detailed PID, user/CPU/memory info
  * htop : modern and interactiver version of top, kill processes directly from the interface using your mouse or keyboard shortcuts.
  * pstree: Displays running processes as a tree diagram, showing the parent-child relationships between them.
  * kill -9 <PID> : Force Kill the process
  * & : Adding this to the end of the command runs the command in the background
  * jobs : Lists all tasks currently running or paused in the background of your current terminal session.
  * nice : Run the process with priorities mentioned.
    eg: nice -n 10 backup_script.sh -- Runs it with lower priority so it doesn't slow down system
