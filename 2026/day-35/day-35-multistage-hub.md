# Day 35 – Multi-Stage Builds & Docker Hub

## Task
Today's goal is to **build optimized images and share them with the world**.

Multi-stage builds are how real teams ship small, secure images. Docker Hub is how you distribute them. Both are interview favourites.

---

## Expected Output
- A markdown file: `day-35-multistage-hub.md`
- Dockerfiles demonstrating multi-stage builds
- An image pushed to your Docker Hub account

---

## Challenge Tasks

### Task 1: The Problem with Large Images
1. Write a simple Go, Java, or Node.js app (even a "Hello World" is fine)
2. Create a Dockerfile that builds and runs it in a **single stage**
3. Build the image and check its **size**

  <img width="1328" height="97" alt="image" src="https://github.com/user-attachments/assets/de767e35-3fd7-4eee-b7f4-064a842a34fc" />

Note down the size — you'll compare it later.

---

### Task 2: Multi-Stage Build
1. Rewrite the Dockerfile using **multi-stage build**:
   - Stage 1: Build the app (install dependencies, compile)
   - Stage 2: Copy only the built artifact into a minimal base image (`alpine`, `distroless`, or `scratch`)
2. Build the image and check its size again
3. Compare the two sizes

   <img width="1328" height="114" alt="image" src="https://github.com/user-attachments/assets/2f2dd937-cc3a-4b29-b636-43246a9ec442" />

Write in your notes: Why is the multi-stage image so much smaller?
   `Multi-stage build = 2 steps: one to build the app, one to run it
    Step 1 (builder): installs everything needed to build — extra tools, dev packages, all source code
    Step 2 (runner): starts clean, only copies the final built files (not the tools used to build them)
    Final image only has what's needed to run the app — nothing extra
    Result: smaller, faster, safer image`

---

### Task 3: Push to Docker Hub
1. Create a free account on [Docker Hub](https://hub.docker.com) (if you don't have one)
2. Log in from your terminal
3. Tag your image properly: `yourusername/image-name:tag`
4. Push it to Docker Hub
5. Pull it on a different machine (or after removing locally) to verify
  <img width="1328" height="292" alt="image" src="https://github.com/user-attachments/assets/07a54f56-dc1b-4444-9dc5-2c43f314d400" />

  <img width="916" height="503" alt="image" src="https://github.com/user-attachments/assets/d97bb9f8-623b-4f16-9a6d-1c45d22d17e1" />

---

### Task 4: Docker Hub Repository
1. Go to Docker Hub and check your pushed image
2. Add a **description** to the repository
3. Explore the **tags** tab — understand how versioning works
4. Pull a specific tag vs `latest` — what happens?

<img width="916" height="615" alt="image" src="https://github.com/user-attachments/assets/7e279bf3-a15f-4f0b-b57b-d1d19f55b68a" />
<img width="1109" height="182" alt="image" src="https://github.com/user-attachments/assets/f631e08c-6476-4007-9a3e-d7bfd430deb9" />

---

### Task 5: Image Best Practices
Apply these to one of your images and rebuild:
1. Use a **minimal base image** (alpine vs ubuntu — compare sizes)
2. **Don't run as root** — add a non-root USER in your Dockerfile
3. Combine `RUN` commands to **reduce layers**
4. Use **specific tags** for base images (not `latest`)

Check the size before and after.

<img width="1062" height="92" alt="image" src="https://github.com/user-attachments/assets/ca4855eb-5bfa-4e30-91dd-fb9e8032c760" />

---

## Hints
- Multi-stage: use `FROM ... AS builder` then `COPY --from=builder`
- Login: `docker login`
- Tag: `docker tag local-image:tag username/repo:tag`
- Push: `docker push username/repo:tag`
- Non-root user: `RUN adduser` + `USER`
  Done
---

## Submission
1. Add your Dockerfiles and `day-35-multistage-hub.md` to `2026/day-35/`
2. Include the link to your Docker Hub repo
3. Commit and push to your fork

---

## Learn in Public
Share your before/after image sizes on LinkedIn — the difference is always impressive.

`#90DaysOfDevOps` `#DevOpsKaJosh` `#TrainWithShubham`

Happy Learning!
**TrainWithShubham**
