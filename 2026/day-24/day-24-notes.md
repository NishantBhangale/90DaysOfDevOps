# Day 24 – Advanced Git: Merge, Rebase, Stash & Cherry Pick

## Task

You know how to branch and push to GitHub. Now it's time to learn how branches come back together — and what to do when you're in the middle of something and need to context-switch. These are the Git skills that separate beginners from confident practitioners.

---

## Expected Output
- A markdown file: `day-24-notes.md` with your observations and answers
- Continue updating `git-commands.md` in your `devops-git-practice` repo

---

## Challenge Tasks

### Task 1: Git Merge — Hands-On
1. Create a new branch `feature-login` from `main`, add a couple of commits to it
2. Switch back to `main` and merge `feature-login` into `main`
3. Observe the merge — did Git do a **fast-forward** merge or a **merge commit**?
4. Now create another branch `feature-signup`, add commits to it — but also add a commit to `main` before merging
5. Merge `feature-signup` into `main` — what happens this time?
6. Answer in your notes:
   - What is a fast-forward merge?
     A fast-forward merge happens when Git can simply move the branch pointer forward because there are no new commits on the current branch.
   - When does Git create a merge commit instead?
     A merge commit is created when both branches have different changes and Git needs to combine them together.
   - What is a merge conflict? (try creating one intentionally by editing the same line in both branches)
     A merge conflict happens when Git finds different changes on the same line (or nearby lines) in two branches and doesn't know which change to keep.
   
   <img width="1252" height="1001" alt="image" src="https://github.com/user-attachments/assets/17bbad07-9f24-4d52-a939-5cbf575419c3" />

---

### Task 2: Git Rebase — Hands-On
1. Create a branch `feature-dashboard` from `main`, add 2-3 commits
2. While on `main`, add a new commit (so `main` moves ahead)
3. Switch to `feature-dashboard` and rebase it onto `main`
4. Observe your `git log --oneline --graph --all` — how does the history look compared to a merge?
5. Answer in your notes:
    - What does rebase actually do to your commits?
     * Rebase creates linear history.
   - How is the history different from a merge?
     * Merge doesn’t change history, it shows commits as they were. What rebase did is it changed history of commits, 
       it showed main commit first then the `feature-dashboard` commit to make it linear.
       It is as if I started `feature-dashboard` from newest `master` commit.
   - Why should you **never rebase commits that have been pushed and shared** with others?
     * Because rebase rewrites commit history. If others have already pulled those commits,
       then it will create confusion and conflicts.
   - When would you use rebase vs merge?
     * Merge, as it preserves when the commit was exactly made.

---

### Task 3: Squash Commit vs Merge Commit
1. Create a branch `feature-profile`, add 4-5 small commits (typo fix, formatting, etc.)
2. Merge it into `main` using `--squash` — what happens?

  <img width="1045" height="250" alt="image" src="https://github.com/user-attachments/assets/df0ff41b-914c-40b2-ac9e-2bea11ed9a4e" />

   
3. Check `git log` — how many commits were added to `main`?
4. Now create another branch `feature-settings`, add a few commits
5. Merge it into `main` **without** `--squash` (regular merge) — compare the history

  <img width="1045" height="142" alt="image" src="https://github.com/user-attachments/assets/135c4d1b-6850-43b2-abc2-d547a7a3a0d0" />

   
6. Answer in your notes:
   - What does squash merging do?
     * It combines multiple commits from a branch and merges them into another branch as a single commit.
   - When would you use squash merge vs regular merge?
     * If one file has multiple commits, then squashing is better. Else regular merge.
   - What is the trade-off of squashing?
     * Detailed commit history is lost from feature branch as only one commit will be shown in main branch.

---

### Task 4: Git Stash — Hands-On
1. Start making changes to a file but **do not commit**
2. Now imagine you need to urgently switch to another branch — try switching. What happens?
3. Use `git stash` to save your work-in-progress
4. Switch to another branch, do some work, switch back
5. Apply your stashed changes using `git stash pop`
6. Try stashing multiple times and list all stashes
7. Try applying a specific stash from the list

   <img width="1045" height="798" alt="image" src="https://github.com/user-attachments/assets/b05bb4af-07dd-45ba-8e9a-c82882508e7a" />

   
9. Answer in your notes:
   - What is the difference between `git stash pop` and `git stash apply`?
     * git stash pop restores the stashed changes and removes them from the stash list.
       git stash apply restores the stashed changes but keeps them in the stash list.
   - When would you use stash in a real-world workflow?
     * We use git stash when we have unfinished changes but need to switch branches.
---

### Task 5: Cherry Picking
1. Create a branch `feature-hotfix`, make 3 commits with different changes

   <img width="1045" height="114" alt="image" src="https://github.com/user-attachments/assets/523a9976-06f1-4584-84ef-f946d61a3dd7" />
 
3. Switch to `main`
4. Cherry-pick **only the second commit** from `feature-hotfix` onto `main`

   <img width="1045" height="114" alt="image" src="https://github.com/user-attachments/assets/fcee2c5c-0b9c-468a-9ca5-14c5e15e27f2" />
   
   <img width="1045" height="138" alt="image" src="https://github.com/user-attachments/assets/a7e213b2-249e-47f7-ad10-651ff5c295c1" />
   
6. Verify with `git log` that only that one commit was applied
7. Answer in your notes:
   - What does cherry-pick do?
     * git cherry-pick takes a specific commit from another branch and applies its changes to your current branch. It creates a new commit on your current branch.
   - When would you use cherry-pick in a real project?
     * We can use cherry-pick when we need one specific change from another branch without merging the whole branch.
   - What can go wrong with cherry-picking?
     * Merge conflicts can happen if the same code was changed on both branches.

---

## Hints
- Visualize history: `git log --oneline --graph --all`
- To intentionally create a merge conflict: edit the **same line** of the **same file** on two branches
- Stash with a message: `git stash push -m "description"`
- Cherry-pick needs a commit hash — find it with `git log --oneline`

---

## Submission
1. Add your `day-24-notes.md` to `2026/day-24/`
2. Update `git-commands.md` with all new commands and commit
3. Push to your fork

---

## Learn in Public

Share your merge vs rebase comparison on LinkedIn — a diagram or screenshot of `git log --graph` goes a long way!

`#90DaysOfDevOps` `#DevOpsKaJosh` `#TrainWithShubham`

Happy Learning!
**TrainWithShubham**
