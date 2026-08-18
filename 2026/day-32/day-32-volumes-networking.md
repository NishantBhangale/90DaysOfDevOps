# Day 32 – Docker Volumes & Networking

## Task
Today's goal is to **solve two real problems: data persistence and container communication**.

Containers are ephemeral — they lose data when removed. And by default, containers can't easily talk to each other. Today you fix both.

---

## Expected Output
- A markdown file: `day-32-volumes-networking.md`
- Screenshots of your experiments

---

## Challenge Tasks

### Task 1: The Problem
1. Run a Postgres or MySQL container
2. Create some data inside it (a table, a few rows — anything)

<img width="789" height="943" alt="image" src="https://github.com/user-attachments/assets/5dc889d6-ac05-4271-862a-2f7cb71ccb07" />

4. Stop and remove the container
5. Run a new one — is your data still there?
   No, we created a database called temp earlier. After removing the old container and starting a new container, the data we created earlier was not preserved.
   Reason : This happened because we didn't create and bind a persistent volume when running the container.
   
   <img width="789" height="608" alt="image" src="https://github.com/user-attachments/assets/4e652e36-6bb6-408a-8db2-38128a89487b" />


Write what happened and why.

---

### Task 2: Named Volumes
1. Create a named volume
   
   <img width="789" height="608" alt="image" src="https://github.com/user-attachments/assets/9395c7f1-f572-4dad-928e-f97f9c81bca6" />

3. Run the same database container, but this time **attach the volume** to it

   <img width="1436" height="121" alt="image" src="https://github.com/user-attachments/assets/4ee036e6-e750-4e54-b643-14e19186f9cd" />
   
5. Add some data, stop and remove the container
   
   <img width="1436" height="867" alt="image" src="https://github.com/user-attachments/assets/439ba08c-16be-404a-8fc2-8ea3085fb91b" />

   <img width="1436" height="170" alt="image" src="https://github.com/user-attachments/assets/df23eb81-adb0-4063-8a4d-145b43c5ada6" />


7. Run a brand new container with the **same volume**

  <img width="1436" height="556" alt="image" src="https://github.com/user-attachments/assets/10a09dc3-0f73-43a3-ab60-8e4bf634a7a7" />
   
9. Is the data still there?
    ` Yes, this time we attached a persistent volume while running the container. In the earlier container, we created the emp_db database.
      After stopping and removing that container and starting a new one with the volume mapped, we were still able to access our emp_db database.
      This means the data was stored in the persistent volume and was available again when we mounted the volume to the new container.`
   
**Verify:** `docker volume ls`, `docker volume inspect`
  <img width="1436" height="781" alt="image" src="https://github.com/user-attachments/assets/d2fe50cd-83bf-4307-8147-03e05af0adeb" />

---

### Task 3: Bind Mounts
1. Create a folder on your host machine with an `index.html` file
2. Run an Nginx container and **bind mount** your folder to the Nginx web directory
3. Access the page in your browser
    <img width="1450" height="85" alt="image" src="https://github.com/user-attachments/assets/37c6eba8-ab49-4ce6-b2f0-c80e9985e2cc" />
    <img width="503" height="187" alt="image" src="https://github.com/user-attachments/assets/27a5ccd5-ef56-49cd-8d0c-f9af9ac45f4a" />
5. Edit the `index.html` on your host — refresh the browser
    <img width="799" height="187" alt="image" src="https://github.com/user-attachments/assets/85478ca2-0229-41ac-bd5e-1f2ef93417fc" />


Write in your notes: What is the difference between a named volume and a bind mount?
## Named Volume vs Bind Mount

| Feature | Named Volume | Bind Mount |
|---|---|---|
| Example | `postgres_data:/var/lib/postgresql/data` | `/home/nishant/data:/var/lib/postgresql/data` |
| Storage location | Docker manages the location | User specifies the host path |
| Host path | Docker-managed, e.g. `/var/lib/docker/volumes/...` | Explicit path such as `/home/nishant/data` |
| Management | Easier; Docker manages it | More manual; user manages the host path |
| Portability | Better; does not depend on a specific host directory | Less portable; host path must exist or be adjusted |
| Access files directly from host | Not normally needed | Yes |
| Common use | Persistent application/database data | Development, source code, configuration files |

---

### Task 4: Docker Networking Basics
1. List all Docker networks on your machine
   <img width="756" height="161" alt="image" src="https://github.com/user-attachments/assets/c11be163-a541-4dc5-9f90-7b74221f01cc" />

3. Inspect the default `bridge` network
4. Run two containers on the default bridge — can they ping each other by **name**?
5. Run two containers on the default bridge — can they ping each other by **IP**?
   <img width="1512" height="735" alt="image" src="https://github.com/user-attachments/assets/80d058a0-819c-4cf3-844f-f90bd71921c5" />
   <img width="1512" height="249" alt="image" src="https://github.com/user-attachments/assets/2049ae56-e8c0-4871-a86f-e6a409a04411" />

   ## Docker Container Connectivity
### Default Bridge Network
    - Container name → ❌
    - Container IP → ✅
### User-Defined Bridge Network
    - Container name → ✅
    - Container IP → ✅
---

### Task 5: Custom Networks
1. Create a custom bridge network called `my-app-net`
2. Run two containers on `my-app-net`
3. Can they ping each other by **name** now?
4. Write in your notes: Why does custom networking allow name-based communication but the default bridge doesn't?

---

### Task 6: Put It Together
1. Create a custom network
2. Run a **database container** (MySQL/Postgres) on that network with a volume for data
3. Run an **app container** (use any image) on the same network
4. Verify the app container can reach the database by container name

---

## Hints
- Volumes: `docker volume create`, `-v volume_name:/path`
- Bind mount: `-v /host/path:/container/path`
- Networking: `docker network create`, `--network`
- Ping: `docker exec container1 ping container2`

---

## Submission
1. Add your `day-32-volumes-networking.md` to `2026/day-32/`
2. Commit and push to your fork

---

## Learn in Public
Share what happened when you deleted a container without a volume on LinkedIn. The "aha moment" is real.

`#90DaysOfDevOps` `#DevOpsKaJosh` `#TrainWithShubham`

Happy Learning!
**TrainWithShubham
