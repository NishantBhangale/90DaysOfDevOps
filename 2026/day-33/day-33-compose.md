# Day 33 – Docker Compose: Multi-Container Basics

## Task
Today's goal is to **run multi-container applications with a single command**.

Yesterday you manually created networks and volumes and ran containers one by one. Docker Compose does all of that in one YAML file.

---

## Expected Output
- A markdown file: `day-33-compose.md`
- All `docker-compose.yml` files you create

---

## Challenge Tasks

### Task 1: Install & Verify
1. Check if Docker Compose is available on your machine
2. Verify the version

   <img width="497" height="68" alt="image" src="https://github.com/user-attachments/assets/2ca96b42-2ad6-44b5-b5fa-08a000691b23" />

---

### Task 2: Your First Compose File
1. Create a folder `compose-basics`
2. Write a `docker-compose.yml` that runs a single **Nginx** container with port mapping
   <img width="497" height="220" alt="image" src="https://github.com/user-attachments/assets/f0fc8fab-32ac-49fd-95e3-3aa48a0bbacc" />
3. Start it with `docker compose up`
4. Access it in your browser
5. Stop it with `docker compose down`
  <img width="799" height="451" alt="image" src="https://github.com/user-attachments/assets/86c9cfe7-436d-4766-9cbd-bfec9f84d174" />

---

### Task 3: Two-Container Setup
Write a `docker-compose.yml` that runs:
- A **WordPress** container
- A **MySQL** container

  <img width="504" height="430" alt="image" src="https://github.com/user-attachments/assets/09bc428e-adcf-494b-b82f-ff6163b05319" />

They should:
- Be on the same network (Compose does this automatically)
- MySQL should have a named volume for data persistence
- WordPress should connect to MySQL using the service name

  <img width="1552" height="142" alt="image" src="https://github.com/user-attachments/assets/39066a61-4451-433b-b95b-532db8bfa3b4" />
  <img width="1552" height="243" alt="image" src="https://github.com/user-attachments/assets/0ef7fe4e-dee1-4afb-b1d4-46f2e0b31a19" />

Start it, access WordPress in your browser, and set it up.

  <img width="357" height="894" alt="image" src="https://github.com/user-attachments/assets/8d6ba39f-0579-4031-a4ba-21b429315fa0" />
  <img width="1037" height="973" alt="image" src="https://github.com/user-attachments/assets/a0bd10c5-369e-4112-a27e-f38fd6d91c5e" />


**Verify:** Stop and restart with `docker compose down` and `docker compose up` — is your WordPress data still there?

  <img width="599" height="96" alt="image" src="https://github.com/user-attachments/assets/b9610b2d-9c37-41e2-b427-8b988c74792e" />

---

### Task 4: Compose Commands
Practice and document these:
1. Start services in **detached mode**

   <img width="602" height="96" alt="image" src="https://github.com/user-attachments/assets/51b1eed1-25d3-44f3-a1c0-92638768b8bf" />

3. View running services

   <img width="1268" height="80" alt="image" src="https://github.com/user-attachments/assets/1364d63a-d533-4d21-80fe-c3884227eec0" />

5. View **logs** of all services
7. View logs of a **specific** service

   <img width="1548" height="193" alt="image" src="https://github.com/user-attachments/assets/5704a6bd-32fc-435e-ab06-6f3eb251cd16" />
   
9. **Stop** services without removing

    <img width="632" height="44" alt="image" src="https://github.com/user-attachments/assets/77ea1b69-f3e0-425b-8efc-eaeb6c4a89ad" />
    
11. **Remove** everything (containers, networks)

    Running `docker system prune` will remove
    1. All stopped containers
    2. All networks not used by at least one container.
    3. All dangling images (images without a tag/not tied to a container).
    4. All unused build caches.
    
13. **Rebuild** images if you make a change

    docker build -t <imagename> .

---

### Task 5: Environment Variables
1. Add environment variables directly in your `docker-compose.yml`
2. Create a `.env` file and reference variables from it in your compose file
3. Verify the variables are being picked up

    <img width="644" height="670" alt="image" src="https://github.com/user-attachments/assets/edbfa6c4-556f-46e0-9f33-2ce305f7a1ab" />
    <img width="1559" height="284" alt="image" src="https://github.com/user-attachments/assets/f695dea1-12f1-409f-8400-deb98557efcc" />


---

## Hints
- Start: `docker compose up -d`
- Stop: `docker compose down`
- Logs: `docker compose logs -f`
- Compose creates a default network for all services automatically
- Service names in compose are the DNS names containers use to talk to each other

---

## Submission
1. Add your compose files and `day-33-compose.md` to `2026/day-33/`
2. Commit and push to your fork

---

## Learn in Public
Share your WordPress + MySQL running via Compose on LinkedIn.

`#90DaysOfDevOps` `#DevOpsKaJosh` `#TrainWithShubham`

Happy Learning!
**TrainWithShubham**
