## Challenge Tasks

### Task 1: Install and Authenticate
1. Install the GitHub CLI on your machine
2. Authenticate with your GitHub account
3. Verify you're logged in and check which account is active
   `gh auth status`

   <img width="1065" height="473" alt="image" src="https://github.com/user-attachments/assets/824c8e1f-2d56-43ef-8870-72ed107a7edf" />
   
5. Answer in your notes: What authentication methods does `gh` support?
   * Web browser or personal access token

---

### Task 2: Working with Repositories
1. Create a **new GitHub repo** directly from the terminal — make it public with a README
2. Clone a repo using `gh` instead of `git clone`
   `gh repo create github_cli --public`
   `gh repo clone NishantBhangale/github_cli`
   <img width="1065" height="168" alt="image" src="https://github.com/user-attachments/assets/cae5711a-61a0-44be-a665-a72b9f4545b8" />

4. View details of one of your repos from the terminal
   `gh repo view NishantBhangale/medshop---Medical-Shop-Inventory-Management`
   <img width="1855" height="909" alt="image" src="https://github.com/user-attachments/assets/bb2fcd5e-e871-4a1c-bb38-c7675be0bdc8" />
   
6. List all your repositories
   `gh repo list`
   <img width="1855" height="688" alt="image" src="https://github.com/user-attachments/assets/ce9da882-4d99-4803-b9d5-b356d83cdadc" />

8. Open a repo in your browser directly from the terminal

   `gh repo view NishantBhangale/tws-devboard --we`
   <img width="981" height="446" alt="image" src="https://github.com/user-attachments/assets/92b5faff-ea07-4eaa-bc6b-a584d540b2b8" />

10. Delete the test repo you created (be careful!)

    `gh repo delete NishantBhangale/github_cli`
    <img width="981" height="72" alt="image" src="https://github.com/user-attachments/assets/cb86f4a0-ca29-494b-8768-33fe64f6c2d0" />

---

<img width="1009" height="727" alt="image" src="https://github.com/user-attachments/assets/cc91cc70-eb6a-4af2-91ea-c1017050f891" />

### Task 3: Issues
1. Create an issue on one of your repos from the terminal — give it a title, body, and a label
   `gh issue create --title "Bug: Login button not working" --body "The login button on the home page is unresponsive when clicked." --label "bug"`
   ``
   <img width="1316" height="143" alt="image" src="https://github.com/user-attachments/assets/9f323422-db0e-47e0-bc84-d20faeb5d611" />
   
3. List all open issues on that repo
   `gh issue list`
   <img width="787" height="157" alt="image" src="https://github.com/user-attachments/assets/192c3647-699c-430b-baff-21826f23233f" />

5. View a specific issue by its number
   `gh issue view 1`
   <img width="860" height="225" alt="image" src="https://github.com/user-attachments/assets/0253b241-d89e-4a9d-b3b1-6a9cfc665feb" />

7. Close an issue from the terminal
   `gh issue close 1`
   <img width="860" height="55" alt="image" src="https://github.com/user-attachments/assets/84d8a2f8-c295-4bd7-aa1b-50cd824937ef" />

9. Answer in your notes: How could you use `gh issue` in a script or automation?

   * To use gh issue in a script or automation, we must configure the CLI for non-interactive mode and handle authentication programmatically. This prevents scripts from hanging while waiting for      human input.
     ```
     - name: Create issue on build failure
     if: failure()
     env:
       GH_TOKEN: ${{ secrets.GITHUB_TOKEN }}
     run: |
       gh issue create \
         --repo "$GITHUB_REPOSITORY" \
         --title "Build Failure: Production Pipeline" \
         --body "The latest deployment failed. Check the workflow logs: $GITHUB_SERVER_URL/$GITHUB_REPOSITORY/actions/runs/$GITHUB_RUN_ID" \
         --label "bug,automated-alert"
      ```

---

### Task 4: Pull Requests
1. Create a branch, make a change, push it, and create a **pull request** entirely from the terminal
   `gh pr create`
   <img width="911" height="485" alt="image" src="https://github.com/user-attachments/assets/44057c66-b1fc-4c87-9f22-e786de40e540" />

3. List all open PRs on a repo
   `gh pr list`
   <img width="911" height="142" alt="image" src="https://github.com/user-attachments/assets/d475d258-47d1-460e-ad3c-ed7333cc1121" />

5. View the details of your PR — check its status, reviewers, and checks
   `gh pr status`
   <img width="911" height="295" alt="image" src="https://github.com/user-attachments/assets/f0e85950-8db7-477b-838e-c778523d6763" />

7. Merge your PR from the terminal
   `gh pr merge #2`
   <img width="911" height="448" alt="image" src="https://github.com/user-attachments/assets/3a31af85-4364-46c9-b30d-ad6c3df1ffbf" />

9. Answer in your notes:
   - What merge methods does `gh pr merge` support?
   *  The gh pr merge command supports the three standard GitHub merge methods. You can enforce a method using its corresponding flag to bypass the interactive menu:
     1. --merge (Merge Commit): ``Creates a merge commit that combines all commits from our branch into the base branch.
     2. --squash (Squash and Merge): Combines all commits from the PR into a single commit on the base branch, keeping the history clean.
     3. --rebase (Rebase and Merge): Recommits each individual commit from our branch onto the base branch without creating a merge commit.
   - How would you review someone else's PR using `gh`?
     1. Inspect the code changes: Use gh pr diff 2 to view the exact code differences directly in our terminal.
     2. Test the code locally: Use gh pr checkout 2 to pull their branch down to your machine so you can run it locally.
     3. Approve the PR: Run gh pr review 2 --approve -b "Looks good!" to approve the changes and unblock the merge.
     4. Request changes: Run gh pr review 2 --request-changes -b "Fix line 15" if the code requires modifications before merging.
     5. Leave a comment: Run gh pr review 2 --comment -b "Quick question about this layout" to offer general feedback without altering the approval status.

---

### Task 5: GitHub Actions & Workflows (Preview)
1. List the workflow runs on any public repo that uses GitHub Actions
   `gh run list -R LondheShubham153/roadmap.ai`
   <img width="1315" height="491" alt="image" src="https://github.com/user-attachments/assets/28ffa020-721d-4f14-9f6c-b36ab330485b" />

3. View the status of a specific workflow run
   `gh run view 34684223877 -R LondheShubham153/roadmap.ai`
   <img width="1315" height="185" alt="image" src="https://github.com/user-attachments/assets/63b1e8fe-9186-4c3d-9fbe-206c079389f9" />

5. Answer in your notes: How could `gh run` and `gh workflow` be useful in a CI/CD pipeline?
   They allow you to automate workflows without interactive sessions, making it easy to trigger, monitor, and manage GitHub Actions directly from scripts or automation tools.
---
