# Day 17 – Shell Scripting: Loops, Arguments & Error Handling

## Task
Level up your scripting — use loops, handle arguments, and deal with errors.

You will:
- Write **for** and **while** loops
- Use **command-line arguments** (`$1`, `$2`, `$#`, `$@`)
- Install packages via script
- Add basic **error handling**

---

## Expected Output
- A markdown file: `day-17-scripting.md`
- All scripts you write during the tasks

---

## Challenge Tasks

### Task 1: For Loop
1. Create `for_loop.sh` that:
   - Loops through a list of 5 fruits and prints each one
     ```
     #!/bin/bash
     fruites=("Mango" "Apple" "Banana" "Oranges" "Grapes")
      for i in ${fruites[@]};do
          echo $i 
      done
      ```
      <img width="576" height="89" alt="image" src="https://github.com/user-attachments/assets/2870d3ad-cf10-4406-90ad-f20a418b08c7" />

2. Create `count.sh` that:
   - Prints numbers 1 to 10 using a for loop
     ```
     #!/bin/bash
      for (( i=0; i<=10; i++ )); do 
          echo $i
      done
     ```
     <img width="553" height="171" alt="image" src="https://github.com/user-attachments/assets/84bdb1f8-2f56-4e49-9684-6771c591e33a" />

---

### Task 2: While Loop
1. Create `countdown.sh` that:
   - Takes a number from the user
   - Counts down to 0 using a while loop
   - Prints "Done!" at the end
  ```
    #!/bin/bash
    
    read -p "Enter the number to start countdown" num
    
    while [[ $num -ge 0 ]]; do
        echo $num
        (( num-- ))
    done
    echo "done"
```
---

### Task 3: Command-Line Arguments
1. Create `greet.sh` that:
   - Accepts a name as `$1`
   - Prints `Hello, <name>!`
   - If no argument is passed, prints "Usage: ./greet.sh <name>"
     ```
     name=$1
      if [ $# -eq 0 ]; then
         echo "Usage: ./greet.sh <name>" 
      else
          echo "hello $name"
      fi
     <img width="610" height="64" alt="image" src="https://github.com/user-attachments/assets/c9032570-d92b-4748-b0a0-a5155bc7bc46" />

     ```
2. Create `args_demo.sh` that:
   - Prints total number of arguments (`$#`)
   - Prints all arguments (`$@`)
   - Prints the script name (`$0`)
    ```
    #!/bin/bash
    echo "total arguments ($#)"
    echo "printing arguments ($@)"
    echo "printing 0th argument $0"
    ```
    <img width="610" height="62" alt="image" src="https://github.com/user-attachments/assets/aefbb560-b95e-4173-a1bd-a10684e1aa91" />

---

### Task 4: Install Packages via Script
1. Create `install_packages.sh` that:
   - Defines a list of packages: `nginx`, `curl`, `wget`
   - Loops through the list
   - Checks if each package is installed (use `dpkg -s` or `rpm -q`)
   - Installs it if missing, skips if already present
   - Prints status for each package
  ```
    #!/bin/bash
    packages=("nginx" "wget" "jenkins" "curl")
    
    for i in ${packages[@]}; do
        status=$(dpkg -s $i &> /dev/null && echo "Installed" || echo "Not installed")
        if [ "$status" == "Installed" ]; then
            echo "package $i is installed, installation skipped"
        else
            echo "installing $i"
            sudo apt-get install $i
        fi
    done

    <img width="619" height="186" alt="image" src="https://github.com/user-attachments/assets/1b6caa48-4d0e-4689-a10d-1a5d9100a346" />

```
  
> Run as root: `sudo -i` or `sudo su`

---

### Task 5: Error Handling
1. Create `safe_script.sh` that:
   - Uses `set -e` at the top (exit on error)
   - Tries to create a directory `/tmp/devops-test`
   - Tries to navigate into it
   - Creates a file inside
   - Uses `||` operator to print an error if any step fails
  
     ```
     #!/bin/bash
      set -e
      
      mkdir /tmp/devops-test || echo "Directory already exists"
      cd /tmp/devops-test
      echo "this is new file" >> newfile.txt || echo "$?"
      cat newfile.txt
      ```
     <img width="587" height="103" alt="image" src="https://github.com/user-attachments/assets/73ac5cdf-6adb-4e9e-b3a5-bf6c94dc69b5" />

Example:
```bash
mkdir /tmp/devops-test || echo "Directory already exists"
```

2. Modify your `install_packages.sh` to check if the script is being run as root — exit with a message if not.
    ```
    if [ "$EUID" -ne 0 ]; then echo "Run as root"; exit 1; fi
    packages=("nginx" "wget" "jenkins" "curl")
    
    for i in ${packages[@]}; do
        status=$(dpkg -s $i &> /dev/null && echo "Installed" || echo "Not installed")
        if [ "$status" == "Installed" ]; then
            echo "package $i is installed, installation skipped"
        else
            echo "installing $i"
            apt-get install $i
        fi
    done
    ```
    <img width="628" height="32" alt="image" src="https://github.com/user-attachments/assets/f514673f-6978-485b-9f12-8fb7b44e35f7" />

---

## Hints
- For loop: `for item in list; do ... done`
- While loop: `while [ condition ]; do ... done`
- Arguments: `$1` first arg, `$#` count, `$@` all args
- Check root: `if [ "$EUID" -ne 0 ]; then echo "Run as root"; exit 1; fi`
- Check package: `dpkg -s <pkg> &> /dev/null && echo "installed"`

---

## Documentation

Create `day-17-scripting.md` with:
- Each script's code and output
- What you learned (3 key points)

---

## Submission
1. Add your scripts and `day-17-scripting.md` to `2026/day-17/`
2. Commit and push to your fork

---

## Learn in Public

Share your scripting progress on LinkedIn.

`#90DaysOfDevOps` `#DevOpsKaJosh` `#TrainWithShubham`

Happy Learning!
**TrainWithShubham**
