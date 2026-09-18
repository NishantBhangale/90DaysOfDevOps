# Day 23 – Git Branching & Working with GitHub

## Task

Now that you know how to create repos, stage, and commit — it's time to learn the most powerful concept in Git: **branching**. Branches let you work on features, fixes, and experiments in isolation without breaking your main code. You'll also push your work to GitHub for the first time.

---

## Expected Output
- A markdown file: `day-23-notes.md` with your answers
- Continue updating `git-commands.md` in your `devops-git-practice` repo
- Your practice repo pushed to GitHub

---

## Challenge Tasks

### Task 1: Understanding Branches
Answer these in your `day-23-notes.md`:
1. What is a branch in Git?
* A branch is a separate workspace use to make changes without affecting main project. A branch points to a commit in git history. 

2. Why do we use branches instead of committing everything to `main`?
* If we commit everything to main then production will break. We only commit to main when the code is verified and works
perfectly. That is why we use branches, experiment on other branches first then commit.

3. What is `HEAD` in Git?
* HEAD points to the latest commit in the git history.

4. What happens to your files when you switch branches?
* Git doesn't store multiple copies of your files as per branche. When you switch branches, git rewrites your working directory to match the commit of the branch you switched to. If that branch has older version you will see older version.
   - Untracked files from previous branch remain untouched.
   - Tracked file will be as per the current branch's commit.
   - Staged files from previous branch need to be stashed, otherwise git may block switch to avoid overwriting.

---

### Task 2: Branching Commands — Hands-On
In your `devops-git-practice` repo, perform the following:
1. List all branches in your repo
2. Create a new branch called `feature-1`
3. Switch to `feature-1`
4. Create a new branch and switch to it in a single command — call it `feature-2`
5. Try using `git switch` to move between branches — how is it different from `git checkout`?
6. Make a commit on `feature-1` that does **not** exist on `main`
7. Switch back to `main` — verify that the commit from `feature-1` is not there
8. Delete a branch you no longer need
9. Add all branching commands to your `git-commands.md`

   <img width="870" height="127" alt="image" src="https://github.com/user-attachments/assets/58ab5099-2148-458e-a44d-99dde82d529c" />

---

### Task 3: Push to GitHub
1. Create a **new repository** on GitHub (do NOT initialize it with a README)
2. Connect your local `devops-git-practice` repo to the GitHub remote
3. Push your `main` branch to GitHub
4. Push `feature-1` branch to GitHub
5. Verify both branches are visible on GitHub

   <img width="1035" height="979" alt="image" src="https://github.com/user-attachments/assets/aa253ef9-01b5-4782-b2a2-41705404b00b" />
   <img width="987" height="353" alt="image" src="https://github.com/user-attachments/assets/a5eee99a-1e06-4dbc-b5f3-687d04256832" />
   <img width="987" height="353" alt="image" src="https://github.com/user-attachments/assets/1dd9c0d5-f696-4163-86d2-135159b1efda" />

7. Answer in your notes: What is the difference between `origin` and `upstream`?
- origin is the name given to the remote repository where we normally push and pull our own project.
  upstream is usually the name given to the original repository when we fork someone else’s project.


---

### Task 4: Pull from GitHub
1. Make a change to a file **directly on GitHub** (use the GitHub editor)
2. Pull that change to your local repo
3. Answer in your notes: What is the difference between `git fetch` and `git pull`?
- git fetch downloads the latest changes from the remote repository but does not apply them to your current branch.
  git pull downloads the latest changes and also applies them to your current branch by merging or rebasing.

---

### Task 5: Clone vs Fork
1. **Clone** any public repository from GitHub to your local machine
2. **Fork** the same repository on GitHub, then clone your fork
3. Answer in your notes:
   - What is the difference between clone and fork?
     - Clone downloads a repository from GitHub to our local computer.
       Fork creates a copy of someone else’s repository in our own GitHub account.
   - When would you clone vs fork?
     - We use clone when we want to work on a repository locally.
       We use fork when we want to make changes to someone else’s project without affecting the original repository.
       
   - After forking, how do you keep your fork in sync with the original repo?
     - First we have to add the original repository as upstream `git remote add upstream https://github.com/ORIGINAL-OWNER/REPOSITORY.git`
       then fetch the latest changes `git fetch upstream`, then switch to our main branch `git chekout main`
       then we have to merge the original repository's changes `git merge upstream/main`
       Push the updated branch to our fork - `git push origin main`
       origin -- Our forked repository
       upstream -- Original repository

---

## Hints
- When you create a branch, it starts from the commit you're currently on
- `git switch` is the modern alternative to `git checkout` for switching branches
- To push a new branch: `git push -u origin <branch-name>`
- A fork is a GitHub concept, not a Git concept

---

## Submission
1. Add your `day-23-notes.md` to `2026/day-23/`
2. Update `git-commands.md` with all new commands and commit
3. Push to your fork

---

## Learn in Public

Share your branching workflow and first GitHub push on LinkedIn.

`#90DaysOfDevOps` `#DevOpsKaJosh` `#TrainWithShubham`

Happy Learning!
**TrainWithShubham**
