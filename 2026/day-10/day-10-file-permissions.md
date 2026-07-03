# File Permissions & File Operations Challenge

## Files Created

* Create empty file devops.txt using touch
* Create notes.txt with some content using cat or echo
* Create script.sh using vim with content: echo "Hello DevOps"
* Verify: ls -l to see permissions

<img width="854" height="180" alt="image" src="https://github.com/user-attachments/assets/88829544-2a22-48fe-9b37-36b44099d284" />

## Read Files

* Read notes.txt using cat

<img width="854" height="52" alt="image" src="https://github.com/user-attachments/assets/b3b4ac85-a72b-4186-92ad-1dee84802794" />

* View script.sh in vim read-only mode - `vim -R script.sh`

<img width="345" height="52" alt="image" src="https://github.com/user-attachments/assets/050d8d30-8165-414c-b254-5f962c4a277b" />

* Display first 5 lines of /etc/passwd using head

<img width="726" height="139" alt="image" src="https://github.com/user-attachments/assets/bf92c9bc-8927-41f7-86be-2ced9baeff21" />

* Display last 5 lines of /etc/passwd using tail

<img width="941" height="139" alt="image" src="https://github.com/user-attachments/assets/096d2b6f-e9b3-4263-8d19-4eddb7081583" />

# Permission Changes

## Understand Permissions

<img width="719" height="113" alt="image" src="https://github.com/user-attachments/assets/4953a49c-8f5a-4f13-88e8-14bb375a6e4a" />

* Current permissions :

  devops.txt : -rw-rw-r--
  
  - `-`     → indicates it’s a regular file (not a directory or special file).
  - `rw-` → (user/owner) → read + write, no execute.
  - `rw-` → (group) → read + write, no execute.
  - `r--` → (others) → read only, no write or execute.

* Same permissions applied to notes.txt and script.sh.

## Modify Permissions

* Make script.sh executable → run it with ./script.sh

<img width="719" height="113" alt="image" src="https://github.com/user-attachments/assets/44523e45-6563-4417-85bd-d9434d4951c4" />

* Set devops.txt to read-only (remove write for all)

<img width="719" height="137" alt="image" src="https://github.com/user-attachments/assets/de6b0019-413e-452c-9904-11597e08c720" />

* Set notes.txt to 640 (owner: rw, group: r, others: none)

<img width="719" height="137" alt="image" src="https://github.com/user-attachments/assets/aa040e28-b4f5-4ebd-9b6d-8b6425fbd725" />

* Create directory project/ with permissions 755

<img width="719" height="118" alt="image" src="https://github.com/user-attachments/assets/5d6f8755-5200-42a0-acc3-a3582ad81cfb" />

## Test Permissions

* Writing to a read-only file - what happens?

Answer : Writing to a read‑only file normally gives Permission denied. 
With sudo, you can override and write to the file — but only if the redirection itself is executed with root privileges (using tee or sudo bash -c).
Even sudo won’t help if the file is set to immutable (via chattr +i) or mounted on a read‑only filesystem.
    
<img width="868" height="103" alt="image" src="https://github.com/user-attachments/assets/7ea01e1a-7788-4e51-ac18-a068043bd604" />

* Try executing a file without execute permission.

Answer : Executing a file without execute permission gives Permission denied. 
Even sudo cannot bypass this, because the shell requires the execute bit.
However, you can still run the file by explicitly invoking the interpreter (e.g., bash script.sh or python3 script.py).

<img width="868" height="103" alt="image" src="https://github.com/user-attachments/assets/713cc38d-d93d-4152-a5be-59a336bf7c1d" />

## Commands Used

* `touch <filename>` - Creates empty file.
* `echo "Hello" > <filename>` - Create file with content.
* `vim <filename>` - Create/open file in Vim.
* `cat <filename>` - Prints files content.
* `vim -R <filename>` - Open file in read only mode.
* `cat /etc/passwd | head -5` - Prints first 5 lines of /etc/passwd.
* `cat /etc/passwd | tail -5` - Prints last 5 lines of /etc/passwd.
* `chmod +x <filename>` - Adding executable permission for all(owner,group,others).
* `chmod -w <filename>` - Removing write permission for all(owner,group,others).
* `mkdir -m 755 <dname>` - Create directory with permissions(rwx,r-x,r-x).

## What I Learned

* Managing files permissions effectively.
* Using sudo can override read & write restrictions.
* Sudo cannot override execute permission but calling the interpreter directly allows execution.
