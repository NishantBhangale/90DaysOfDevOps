# Day 18 – Shell Scripting: Functions & intermediate Concepts

## Task
Write cleaner, reusable scripts — learn functions, strict mode, and real-world patterns.

You will:
- Write and call **functions**
- Use **`set -euo pipefail`** for safer scripts
- Work with **return values** and **local variables**
- Build an intermediate script

---

## Expected Output
- A markdown file: `day-18-scripting.md`
- All scripts you write during the tasks

---

## Challenge Tasks

### Task 1: Basic Functions
1. Create `functions.sh` with:
   - A function `greet` that takes a name as argument and prints `Hello, <name>!`
   - A function `add` that takes two numbers and prints their sum
   - Call both functions from the script

     ```
     #!/bin/bash
     set -euo pipefail
      function_greet(){
          local name=$1
          echo "Hello $name!"
      }
      function_add(){
          local num1=$1
          local num2=$2
          echo "sum is $(( num1+num2 ))"
      }
      
      if [ $# -eq 3 ]; then
          function_greet "$1"
          function_add "$2" "$3" 
      else
          echo "Usage: $0 <name> <num1> <num2>"
      fi
    ````
<img width="657" height="75" alt="image" src="https://github.com/user-attachments/assets/4f96db62-cbfd-4db3-840b-14c07562afac" />

---

### Task 2: Functions with Return Values
1. Create `disk_check.sh` with:
   - A function `check_disk` that checks disk usage of `/` using `df -h`
   - A function `check_memory` that checks free memory using `free -h`
   - A main section that calls both and prints the results
    ```
    #!/bin/bash
    set -euo pipefail
    
    function_check_disk(){
        echo "checking disk space of /"
        df -h /
    }
    function_check_memory(){
        echo "checking memory"
        free -h
    }
    
    result1=$(function_check_disk)
    result2=$(function_check_memory)
    
    echo "disk_check $result1"
    echo "####################"
    echo "memory_check $result2" 
    ```
    <img width="592" height="127" alt="image" src="https://github.com/user-attachments/assets/9811d96e-04d0-4082-a0fc-25962f80e8da" />

---

### Task 3: Strict Mode — `set -euo pipefail`
1. Create `strict_demo.sh` with `set -euo pipefail` at the top
2. Try using an **undefined variable** — what happens with `set -u`?
3. Try a command that **fails** — what happens with `set -e`?
4. Try a **piped command** where one part fails — what happens with `set -o pipefail`?

**Document:** What does each flag do?
- `set -e` → Exits the script immediately if any command returns a non-zero exit status. Without this, Bash just moves on to the next line even after a command fails, silently continuing with a broken state.
- `set -u` → Treats references to unset variables as an error and exits, instead of silently substituting an empty string.
- `set -o pipefail` → By default, a pipeline's exit status is only that of the last command. pipefail makes the whole pipeline fail if any command in it fails - not just the last one.

---

### Task 4: Local Variables
1. Create `local_demo.sh` with:
   - A function that uses `local` keyword for variables
   - Show that `local` variables don't leak outside the function
   - Compare with a function that uses regular variables

---

### Task 5: Build a Script — System Info Reporter
Create `system_info.sh` that uses functions for everything:
1. A function to print **hostname and OS info**
2. A function to print **uptime**
3. A function to print **disk usage** (top 5 by size)
4. A function to print **memory usage**
5. A function to print **top 5 CPU-consuming processes**
6. A `main` function that calls all of the above with section headers
7. Use `set -euo pipefail` at the top

Output should look clean and readable.

---

## Hints
- Function syntax: `function_name() { ... }`
- Local vars: `local MY_VAR="value"`
- Strict mode: `set -euo pipefail` as first line after shebang
- Pass args to functions: `greet "Shubham"` → access as `$1` inside
- `$?` gives the exit code of last command

---

## Documentation

Create `day-18-scripting.md` with:
- Each script's code and output
- Explanation of `set -euo pipefail`
- What you learned (3 key points)

---

## Submission
1. Add your scripts and `day-18-scripting.md` to `2026/day-18/`
2. Commit and push to your fork

---

## Learn in Public

Share what you learned about shell functions and strict mode on LinkedIn.

`#90DaysOfDevOps` `#DevOpsKaJosh` `#TrainWithShubham`

Happy Learning!
**TrainWithShubham**
