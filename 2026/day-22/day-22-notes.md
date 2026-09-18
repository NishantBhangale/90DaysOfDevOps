# Day 22 – Introduction to Git: Your First Repository

## Task

### Task 1: Install and Configure Git
1. Verify Git is installed on your machine
2. Set up your Git identity — name and email
3. Verify your configuration

   <img width="755" height="119" alt="image" src="https://github.com/user-attachments/assets/a5946565-3aae-4277-9083-43d4715bfd40" />

---

### Task 2: Create Your Git Project
1. Create a new folder called `devops-git-practice`
2. Initialize it as a Git repository
3. Check the status — read and understand what Git is telling you
4. Explore the hidden `.git/` directory — look at what's inside

    <img width="1024" height="337" alt="image" src="https://github.com/user-attachments/assets/e73fe2de-6eb6-4823-8f0c-b17edc1ff51b" />

---

### Task 3: Create Your Git Commands Reference
1. Create a file called `git-commands.md` inside the repo
2. Add the Git commands you've used so far, organized by category:
   - **Setup & Config**
   - **Basic Workflow**
   - **Viewing Changes**
3. For each command, write:
   - What it does (1 line)
   - An example of how to use it
   - Done
---

### Task 4: Stage and Commit
1. Stage your file
2. Check what's staged
3. Commit with a meaningful message
4. View your commit history

   <img width="1024" height="510" alt="image" src="https://github.com/user-attachments/assets/e1556fb6-a0db-4093-a84c-64a7592c7ddc" />

   <img width="773" height="140" alt="image" src="https://github.com/user-attachments/assets/2021b01e-6ae6-4161-95a6-5dc6d1f64c8f" />

---

### Task 5: Make More Changes and Build History
1. Edit `git-commands.md` — add more commands as you discover them
2. Check what changed since your last commit
3. Stage and commit again with a different, descriptive message
4. Repeat this process at least **3 times** so you have multiple commits in your history
5. View the full history in a compact format

    <img width="870" height="118" alt="image" src="https://github.com/user-attachments/assets/02fbf340-b66f-4a93-baf4-7d129e8c776c" />


---

## Task 6: Understand the Git Workflow

1. What is the difference between `git add` and `git commit`?
* `git add`- keeps file in staging area. So it can be included in next commit.
* `git commit` - Commits staged changes into the repository history with a message. Creates a new commit with commit id.
 
2. What does the **staging area** do? Why doesn't Git just commit directly?
* Staging area stores files/changes that need to be added in next commit. 
 What if I accidentally added something, and it gets committed(ex:private key).That is why staging is needed,
 So if I added something mistakenly it can be unstaged without any mess.
 Also we can commit multiple changes with single commit.
 
3. What information does `git log` show you?
* `git log` - shows commit history.

4. What is the `.git/` folder and what happens if you delete it?
* `.git/` - git folder stores the complete history of your repository, holds config file, hooks.
 If you delete .git folder, your project history is gone. Nothing can be tracked. It basically becomes normal directory.

5. What is the difference between a **working directory**, **staging area**, and **repository**?
* **working directory** - It is your project directory. Where you write files. Changes here are not tracked until you add,commit.
* **staging area** - After adding files to staging area it can be committed and traced.
* **repository** - All your commites, branches is your repository. Basically history of your working directory
     with version control.


---

## Ongoing Task

**Keep updating `git-commands.md` every day** as you learn new Git commands in the upcoming days. This will become your personal Git reference. Maintain a clean commit history — one commit per update with a clear message.

---

## Hints
- All you need today are about 8-10 Git commands — Google them, try them, break things
- Read what `git status` tells you — it's your best friend
- Use `man git-<command>` or `git <command> --help` to explore

---

## Submission
1. Share a screenshot of your `git log --oneline` output showing multiple commits
2. Add your `day-22-notes.md` to `2026/day-22/`
3. Commit and push to your fork
4. Add your submission for Community Builder of the week on discord

---

## Learn in Public

Share your first Git repo and commit history on LinkedIn.

`#90DaysOfDevOps` `#DevOpsKaJosh` `#TrainWithShubham`

Happy Learning!
**TrainWithShubham**
