## Challenge Tasks

### Task 1: The Problem
Think about a team of 5 developers all pushing code to the same repo manually deploying to production.

Write in your notes:
1. What can go wrong?
   * If everyone pushes changes directly to the same branch, it can cause merge conflicts, overwritten changes, and unnecessary time spent resolving issues. This can reduce team productivity.
3. What does "it works on my machine" mean and why is it a real problem? 
   * It means the application works on one developer's machine but fails on another machine because of differences in dependencies, versions, environment variables, operating system, or configuration.
4. How many times a day can a team safely deploy manually? not more than 1 or max 2 times
   * Manual deployments should be kept limited because they are time-consuming and can introduce human errors. The exact number depends on the team's process, application, testing, and risk. Frequent deployments are safer when automated using CI/CD.
---

### Task 2: CI vs CD
Research and write short definitions (2-3 lines each):
1. **Continuous Integration**
   * what happens
   - Developers regularly add their code to the shared project. Every time code is added, the system automatically builds and tests it to find errors early. CI catches problems early when              developers add code to the shared repository, such as: Build errors, Code/test failures, Integration or merge problems, Missing dependencies, Bugs introduced by new changes.
   * how often
   - Every time a code is pushed, multiple times a day.
   * what it catches
     Compiling errors, logic errors, integration issues, environment config issues
   * Example:
     Developers working on the shopping application push their code to GitHub several times a day. Every push automatically starts a CI pipeline that builds the application and runs tests. If a        developer breaks the payment or login functionality, the CI pipeline detects the problem before the code is merged.
     
3. **Continuous Delivery**
   * how it's different from CI
   - After the code passes the tests, it is automatically prepared and kept ready for production. The final production release may still need a manual approval.
   - CI focuses on automatically building and testing the code whenever developers make changes. Continuous Delivery goes one step further: after the code passes CI, it is prepared and kept ready      for release.
   * what "delivery" means
   - Delivery gurantees production readiness at anytime, a human or automated trigger can deploy it with a single click or command.
   * Example: Amazon
   - Every service is packaged and tested. Artifacts are stored in registries. And deployment can be triggred at any time.
     
5. **Continuous Deployment** — how it differs from Delivery, when teams use it
   - It is like Continuous Delivery, but there is no manual approval. If the code passes all tests, it is automatically deployed to production.
   - How it differs from delivery, when team use it?
   * Teams use it when they have:
     * Strong automated testing
     * Reliable CI/CD pipelines
     * Automated deployment and monitoring
     * monitoring and rollback strategies.
     * Confidence that every successful change can safely go to production
   * Example: Netflix
     Code that passes automated tests is automatically deployed to production without human approval. It relies on strong monitoring, canary releases and rollback systems. 
---

### Task 3: Pipeline Anatomy
A pipeline has these parts — write what each one does:
- **Trigger** —
   -  What starts the pipeline. It can a push, pull request, scheduled cron job, 
      manual action.
- **Stage** —
   - A logical grouping of jobs, organizes the pipeline into clear 
     phases(build, test, deploy) for readability and control.
- **Job** — 
   - A unit of work inside a stage. 
   - Breaks down stages into smaller, executable tasks.
   - Each job runs independently, can contain multiple steps.
   - Examples: Cloning code, running tests, building images.
- **Step** — 
   - A single command or action inside a job, smallest execution unit.
   - Examples: npm install, docker build
- **Runner** — 
   - The machine that executes the job, it provides the environment where jobs run.
- **Artifact** — 
   - An output produced by a job, stored for later use.
   - Examples: Docker image, compiled binaries.
   - Allows sharing results between stages(build->test->deploy)

---

### Task 4: Draw a Pipeline
Draw a CI/CD pipeline for this scenario:
> A developer pushes code to GitHub. The app is tested, built into a Docker image, and deployed to a staging server.

<img width="1569" height="703" alt="image" src="https://github.com/user-attachments/assets/59d39c4e-8ad7-4b7f-ae11-61a11bf98f38" />


---

### Task 5: Explore in the Wild
1. Open any popular open-source repo on GitHub (Kubernetes, React, FastAPI — pick one you know)
2. Find their `.github/workflows/` folder
3. Open one workflow YAML file - https://github.com/react/react/blob/main/.github/workflows/devtools_regression_tests.yml
4. Write in your notes:
   - What triggers it?
     * Manual action.
     * Push on branch master, pushed only on specified files.
   - How many jobs does it have?
     * 4 Jobs 
   - What does it do? (best guess)
     1. download_build : Get the existing React DevTools build that will be used as the base.
     2. build_devtools_and_process_artifacts : Build the new React DevTools and prepare its artifacts.
     3. run_devtools_tests_for_versions : Test DevTools against different React versions.
     4. run_devtools_e2e_tests_for_versions : Run end-to-end (E2E) tests of DevTools against different React versions.
---
