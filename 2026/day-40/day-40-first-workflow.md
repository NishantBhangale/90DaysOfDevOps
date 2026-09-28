# Day 40 – Your First GitHub Actions Workflow

## Task
Today you write your **first GitHub Actions pipeline** and watch it run in the cloud.

This is the moment CI/CD stops being a concept and becomes real.

---

## Expected Output
- A workflow file: `.github/workflows/hello.yml`
- A markdown file: `day-40-first-workflow.md`
- Screenshot of your first green pipeline run

---

## Challenge Tasks

### Task 1: Set Up
1. Create a new **public** GitHub repository called `github-actions-practice`
2. Clone it locally
3. Create the folder structure: `.github/workflows/`

<img width="957" height="497" alt="image" src="https://github.com/user-attachments/assets/a595fbb3-aa92-4778-8f02-0b8d5e555471" />


---

### Task 2: Hello Workflow
Create `.github/workflows/hello.yml` with a workflow that:
1. Triggers on every `push`
2. Has one job called `greet`
3. Runs on `ubuntu-latest`
4. Has two steps:
   - Step 1: Check out the code using `actions/checkout`
   - Step 2: Print `Hello from GitHub Actions!`

Push it. Go to the **Actions** tab on GitHub and watch it run.

**Verify:** Is it green? Click into the job and read every step.

```
name: hello-workflow

on:
  push:
    branches:
      - main

jobs:
  greet:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout the code
        uses: actions/checkout@v4

      - name: Print Hello
        run: echo "Hello from GitHub Actions!"
```
<img width="1094" height="564" alt="image" src="https://github.com/user-attachments/assets/537a2ef1-0c22-4d14-aa05-83793a3f3e81" />
<img width="1094" height="671" alt="image" src="https://github.com/user-attachments/assets/a6edce30-831b-4289-b3bd-3b16f5c9de05" />

---

### Task 3: Understand the Anatomy

- `on: When the workflow should run on push, workflow dispatch (manual trigger)` 
- `jobs: What jobs the workflow will perform`
- `runs-on: Which machine/OS the job will run on - ubuntu, macos`
- `steps: List of tasks performed inside a job`
- `uses: Use an existing GitHub Action`
- `run: Run a shell command`
- `name: Gives a readable name to a job or step`

---

### Task 4: Add More Steps
Update `hello.yml` to also:
1. Print the current date and time
2. Print the name of the branch that triggered the run (hint: GitHub provides this as a variable)
3. List the files in the repo
4. Print the runner's operating system

Push again — watch the new run.

```
name: hello-workflow

on:
  push:
    branches:
      - main

jobs:
  greet:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout the code
        uses: actions/checkout@v4

      - name: Print Hello
        run: echo "Hello from GitHub Actions!"

      - name: Print Date
        run: echo "Current date and time is $(date +'%Y-%m-%d %H:%M')"

      - name: Print Triggering Branch
        run: |
          echo "This workflow was triggered by the branch: ${{ github.ref_name }}"

      - name: List files in the repository
        run: |
          echo "=== Simple file list === $(ls -la)"

      - name: Print runner's operating system
        run: |
          echo "=== Runner's operating system === ${{ runner.os }}"
```
<img width="955" height="1006" alt="image" src="https://github.com/user-attachments/assets/ceda6711-1bc2-4799-86c5-07d182e47f65" />

---

### Task 5: Break It On Purpose
1. Add a step that runs a command that will **fail** (e.g., `exit 1` or a misspelled command)
2. Push and observe what happens in the Actions tab
3. Fix it and push again
   <img width="1305" height="820" alt="image" src="https://github.com/user-attachments/assets/c7a5ffee-f155-4058-8301-2d8811c3e467" />

   <img width="1305" height="820" alt="image" src="https://github.com/user-attachments/assets/e4726c9d-0089-4308-88d8-678913feb08f" />


Write in your notes: What does a failed pipeline look like? How do you read the error?

<img width="1305" height="757" alt="image" src="https://github.com/user-attachments/assets/a7d48501-8406-491f-941a-9f7c146334bb" />

Error can be visible on Dashboard page of workflow run status also for detail infomation, if we click workflow's job, it will give where exactly the workflow got failed.

---

## Hints
- Workflow files live in `.github/workflows/` and must end in `.yml`
- `uses: actions/checkout@v4` checks out your code onto the runner
- `run:` executes shell commands
- GitHub provides built-in variables like `${{ github.ref_name }}` for branch name
- Every push triggers a new run — check the Actions tab

---

## Documentation
Create `day-40-first-workflow.md` with:
- Your workflow YAML
- Screenshot of the green run
- What each `on:`, `jobs:`, `steps:` key does (your own words)

---
