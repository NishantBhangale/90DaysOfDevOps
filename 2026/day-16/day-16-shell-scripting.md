# Day 16 – Shell Scripting Basics

## Task
Start your shell scripting journey — learn the fundamentals every script needs.

You will:
- Understand **shebang** (`#!/bin/bash`) and why it matters
- Work with **variables**, **echo**, and **read**
- Write basic **if-else** conditions

---

## Expected Output
- A markdown file: `day-16-shell-scripting.md`
- All scripts you write during the tasks

---

## Challenge Tasks

### Task 1: Your First Script
1. Create a file `hello.sh`
   
3. Add the shebang line `#!/bin/bash` at the top
4. Print `Hello, DevOps!` using `echo`
5. Make it executable and run it

  <img width="612" height="89" alt="image" src="https://github.com/user-attachments/assets/e0d68ad3-4c09-43c2-81b6-7a844cf1ac93" />

```bash
chmod +x hello.sh
./hello.sh
```

**Document:** What happens if you remove the shebang line?
   Without a shebang, `./script.sh` is executed by the current/default shell (which may not be Bash), so Bash-specific syntax can break. Running it explicitly as `bash script.sh` still       works fine, since the interpreter is specified directly on the command line.
---

### Task 2: Variables
1. Create `variables.sh` with:
   - A variable for your `NAME`
   - A variable for your `ROLE` (e.g., "DevOps Engineer")
   - Print: `Hello, I am <NAME> and I am a <ROLE>`

     <img width="584" height="132" alt="image" src="https://github.com/user-attachments/assets/de10158d-17f7-4d85-afb8-0d256fe10167" />

2. Try using single quotes vs double quotes — what's the difference?
## Single quotes vs double quotes in Bash

- **Single quotes (`'...'`)** — everything inside is treated as a literal string. Variables and special characters are **not** expanded. `'$NAME'` would print the literal text `$NAME`, not its value.
- **Double quotes (`"..."`)** — allow **variable expansion** (`$NAME`) and command substitution (`` `cmd` `` or `$(cmd)`), while still protecting spaces and most special characters from the shell.

In the example script:
```bash
NAME='Nishant'
ROLE="Devops Engineer"
echo "Hello, I am $NAME and I am a $ROLE"
```
- `NAME` and `ROLE` are just assigned literal strings here — quoting style doesn't matter for assignment itself (both single and double quotes work the same way for plain text with no `$` or spaces to expand).
- The difference shows up in the `echo` line: because it uses **double quotes**, `$NAME` and `$ROLE` are expanded to their values, producing:
- If the `echo` line used single quotes instead (`echo '...$NAME...'`), it would print `$NAME` literally instead of `Nishant`.
   
---

### Task 3: User Input with read
1. Create `greet.sh` that:
   - Asks the user for their name using `read`
   - Asks for their favourite tool
   - Prints: `Hello <name>, your favourite tool is <tool>`
<img width="335" height="98" alt="image" src="https://github.com/user-attachments/assets/14432520-ebcb-48a1-9dc1-3989c6ddbbd4" />
<img width="584" height="64" alt="image" src="https://github.com/user-attachments/assets/a91b9b05-c47c-4fa0-8ce3-455b5c2e67c3" />

---

### Task 4: If-Else Conditions
1. Create `check_number.sh` that:
   - Takes a number using `read`
   - Prints whether it is **positive**, **negative**, or **zero**

   `#!/bin/bash
   read -p "Enter number to check" number
   
   if [[ $number -gt 0 ]]; then
   	echo "number is positive"
   elif [[ $number -eq 0 ]]; then
   	echo "number is zero"
   else
   	echo "number is negative"
   fi`

2. Create `file_check.sh` that:
   - Asks for a filename
   - Checks if the file **exists** using `-f`
   - Prints appropriate message

`#!/bin/bash

echo "Current directory is $(pwd)"
read -p "Enter the file you want to search: " file

if [ -f $file ]; then
    echo "file found"
else
    echo "no result found"
fi`

<img width="587" height="116" alt="image" src="https://github.com/user-attachments/assets/7b368b11-939b-498f-a56d-3ad0535be307" />

---

### Task 5: Combine It All
Create `server_check.sh` that:
1. Stores a service name in a variable (e.g., `nginx`, `sshd`)
2. Asks the user: "Do you want to check the status? (y/n)"
3. If `y` — runs `systemctl status <service>` and prints whether it's **active** or **not**
4. If `n` — prints "Skipped."
   
`service1=sshd
service2=nginx

echo "the services available on system are $service1 and $service2"

read -p "Do you want to check the status? (y/n) " choice

if [[ "$choice" == 'y' ]]; then
    echo "$service1 is $(systemctl is-active $service1)"
elif [[ "$choice" == 'n' ]]; then
    echo "Skipped"
else
    echo "Invalid input, please enter y or n"
fi`

---

## Hints
- Shebang: `#!/bin/bash` tells the system which interpreter to use
- Variables: `NAME="Shubham"` (no spaces around `=`)
- Read: `read -p "Enter name: " NAME`
- If syntax: `if [ condition ]; then ... elif ... else ... fi`
- File check: `if [ -f filename ]; then`

---

## Documentation

Create `day-16-shell-scripting.md` with:
- Each script's code and output
- What you learned (3 key points)

---

## Submission
1. Add your scripts and `day-16-shell-scripting.md` to `2026/day-16/`
2. Commit and push to your fork

---

## Learn in Public

Share your first shell scripts on LinkedIn.

`#90DaysOfDevOps` `#DevOpsKaJosh` `#TrainWithShubham`

Happy Learning!
**TrainWithShubham**
