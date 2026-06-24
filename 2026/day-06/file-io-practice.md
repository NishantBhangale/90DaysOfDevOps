# Day 5 - Linux File Handling & Text Processing

## Objective

Practice basic Linux file operations and understand the difference between file overwrite and append operations.

## Commands Practiced

### Create a File

```bash
touch notes.txt
```

Creates an empty file named `notes.txt`.

### Write Content Using >

```bash
echo "Hello from Linux" > notes.txt
```

`>` redirects output to a file.

If the file already contains data, it will overwrite the existing content.

Example:

```bash
echo "Hello from Ubuntu" > notes.txt
```

Output:

```text
Hello from Ubuntu
```

The previous content is replaced.

### Append Content Using >>

```bash
echo "Hello from Linux" >> notes.txt
```

`>>` appends data to the end of the file without deleting existing content.

Output:

```text
Hello from Ubuntu
Hello from Linux
```

### Display File Content

```bash
cat notes.txt
```

Displays the complete content of the file.

### View First Lines

```bash
head notes.txt
```

Displays the first 10 lines of a file.

```bash
head -n 2 notes.txt
```

Displays only the first 2 lines.

Output:

```text
Hello from Ubuntu
Hello from Linux
```

### View Last Lines

```bash
tail notes.txt
```

Displays the last 10 lines of a file.

```bash
tail -n 2 notes.txt
```

Displays only the last 2 lines.

Output:

```text
server03 192.168.1.12 active
server04 192.168.1.13 maintenance
```

### Write and Display Using tee

```bash
tee notes.txt
```

Input:

```text
test
line
```

Output:

```text
test
line
```

Content of notes.txt:

```text
test
line
```

`tee` writes input to a file and displays it on the terminal at the same time.

## What I Learned

* `>` overwrites existing file content.
* `>>` appends content to an existing file.
* `cat` displays the entire file.
* `head` displays the beginning of a file.
* `tail` displays the end of a file.
* `tee` writes and displays output simultaneously.
* These commands are frequently used while working with configuration files, logs, and shell scripts.

## Commands Used

```bash
touch notes.txt

echo "Hello from Linux" > notes.txt
echo "Hello from Ubuntu" > notes.txt
echo "Hello from Linux" >> notes.txt

cat notes.txt

head notes.txt
head -n 2 notes.txt

tail notes.txt
tail -n 2 notes.txt

tee notes.txt
```
<img width="799" height="744" alt="image" src="https://github.com/user-attachments/assets/5a228227-10b8-4a67-9784-3ebf7582d76e" />
<img width="807" height="336" alt="image" src="https://github.com/user-attachments/assets/e45bb231-2a75-4b10-b66a-9105f5954b06" />





