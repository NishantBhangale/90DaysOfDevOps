# Day 34 – Docker Compose: Real-World Multi-Container Apps

## Task
Today's goal is to **build more complex, production-like setups with Docker Compose**.

Yesterday was basics. Today you handle real scenarios — app + database + cache, healthchecks, restart policies, and service dependencies.

---

## Expected Output
- A markdown file: `day-34-compose-advanced.md`
- All compose files and Dockerfiles you create

---

## Challenge Tasks

### Task 1: Build Your Own App Stack
Create a `docker-compose.yml` for a 3-service stack:
- A **web app** (use Python Flask, Node.js, or any language you know)
- A **database** (Postgres or MySQL)
- A **cache** (Redis)

Write a simple Dockerfile for the web app. The app doesn't need to be complex — even a "Hello World" that connects to the database is enough.
- Done
---

### Task 2: depends_on & Healthchecks
1. Add `depends_on` to your compose file so the app starts **after** the database
2. Add a **healthcheck** on the database service
3. Use `depends_on` with `condition: service_healthy` so the app waits for the database to be truly ready, not just started

**Test:** Bring everything down and up — does the app wait for the DB?
- Yes, Done
---

### Task 3: Restart Policies
1. Add `restart: always` to your database service
2. Manually kill the database container — does it come back?
   - Yes
3. Try `restart: on-failure` — how is it different?

   <img width="1470" height="898" alt="image" src="https://github.com/user-attachments/assets/92dea156-90a0-411f-99ff-e986e010176d" />
   - restart: on-failure restarts the container only when it exits with a non-zero (error) exit code
   - it does not restart on a clean/successful exit (code 0), and it does not restart after a manual docker stop either.

4. Write in your notes: When would you use each restart policy?
   - restart:always: Databases, Backend APIs, Production services, Anything that must always run.
   - restart:on-failure: One-time migration scripts.

---

### Task 4: Custom Dockerfiles in Compose
1. Instead of using a pre-built image for your app, use `build:` in your compose file to build from a Dockerfile
2. Make a code change in your app
3. Rebuild and restart with one command
  - Done
---

### Task 5: Named Networks & Volumes
1. Define **explicit networks** in your compose file instead of relying on the default
2. Define **named volumes** for database data
3. Add **labels** to your services for better organization
  - Done
---

### Task 6: Scaling (Bonus)
1. Try scaling your web app to 3 replicas using `docker compose up --scale`
   <img width="1470" height="244" alt="image" src="https://github.com/user-attachments/assets/9bd3008d-0828-4a47-8752-937c94a7f920" />
2. What happens? What breaks?
3. Write in your notes: Why doesn't simple scaling work with port mapping?
   - Docker scale fails, giving error port is already allocated.
---
### Result

<img width="1848" height="726" alt="image" src="https://github.com/user-attachments/assets/5468d6fe-4a36-4162-9425-1e46a29cbbea" />

---
## Hints
- Build from Dockerfile: `build: ./app`
- Healthcheck: `healthcheck:` with `test`, `interval`, `timeout`
- Rebuild: `docker compose up --build`
- Scale: `docker compose up --scale web=3`

---

## Submission
1. Add your compose files, Dockerfiles, and `day-34-compose-advanced.md` to `2026/day-34/`
2. Commit and push to your fork

---

## Learn in Public
Share your 3-service app stack running via Compose on LinkedIn.

`#90DaysOfDevOps` `#DevOpsKaJosh` `#TrainWithShubham`

Happy Learning!
**TrainWithShubham**
