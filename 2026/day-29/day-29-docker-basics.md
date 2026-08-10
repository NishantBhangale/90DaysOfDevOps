## Challenge Tasks

### Task 1: What is Docker?
- What is a container and why do we need them?

  A container is a standard unit of software that packages up code and all its dependencies so the application runs quickly and reliably from one computing environment to another.
  A software container is a lightweight, standalone, and executable package that bundles an application's code, runtime, libraries, and settings.
  We need containers primarily to solve the age-old developer complaint: "It worked on my computer, but it doesn’t work in production."
  Containers are isolated, lightweight, portable and runs on any OS. Containers are like virtualization running on docker engine. 
  
- Containers vs Virtual Machines — what's the real difference?
  
  | Containers | Virtual Machines |
    |------------|------------------|
    | Uses Hosts OS | Have their own OS |
    | Shared resources from machine | Dedicated resources from machine |
    | Lightweight | Heavy |
    | Fast performance | Slow performance |
    | Highly portable | Less portable |
  
- What is the Docker architecture? (daemon, client, images, containers, registry)
  
   * Daemon - It manages containers, images, networks, volumes. In short all objects of Docker.
    * Client - It is used to command docker daemon. It can manage one or more docker daemon.
    * Images - It is the blueprint to build container. It contains all the commands to run an application.
    * Containers - It is the actual instance of an image. Application runs inside container isolated.
    * Registry - It is where all the images are stored. There are tow types :
       * Public : e.g. Docker Hub, accessible to everyone.
       * Private : Used by enterprises for internal images.
     
    FloW
  docker run nginx
     ↓
  Client sends request to Daemon
     ↓
  Daemon checks if image exists locally → if not, pulls from Registry
     ↓
  Daemon uses containerd/runc to create a container from the image
     ↓
  Container runs as an isolated process on the host kernel

---

### Task 2: Install Docker
1. Install Docker on your machine (or use a cloud instance)
2. Verify the installation
3. Run the `hello-world` container
4. Read the output carefully — it explains what just happened
   
   <img width="787" height="492" alt="image" src="https://github.com/user-attachments/assets/1182beda-5db8-4265-8e2a-e3685ba24a6d" />

---

### Task 3: Run Real Containers
1. Run an **Nginx** container and access it in your browser
   <img width="793" height="52" alt="image" src="https://github.com/user-attachments/assets/83ab3879-0868-4ad1-bc1d-e048d4020606" />
   <img width="1066" height="321" alt="image" src="https://github.com/user-attachments/assets/f2469b7e-fbf3-494a-829a-8e0c00e41a93" />

3. Run an **Ubuntu** container in interactive mode — explore it like a mini Linux machine
   <img width="795" height="250" alt="image" src="https://github.com/user-attachments/assets/f319a8a6-c3db-42a4-8748-9c607b79e661" />

5. List all running containers
   <img width="1394" height="78" alt="image" src="https://github.com/user-attachments/assets/f8d9f4e3-d843-4a82-88c3-6c2345f88a7c" />

7. List all containers (including stopped ones)
   <img width="1569" height="160" alt="image" src="https://github.com/user-attachments/assets/69b32aed-b5a9-46db-ac7b-88796a0c93ee" />

9. Stop and remove a container
   <img width="627" height="49" alt="image" src="https://github.com/user-attachments/assets/fc3baced-0d02-4664-b442-fd4cea82d9d1" />
---

### Task 4: Explore
1. Run a container in **detached mode** — what's different?
     * Running a container in detached mode frees terminal, container run in background, we only get container id and 
      manage it using docker commands with its id.
     * Running directly without -d, runs it in foreground, it shows live logs.outputs, pressing ctl+c stops it 
      and exits container.
3. Give a container a custom **name**
5. Map a **port** from the container to your host
   
   <img width="1336" height="115" alt="image" src="https://github.com/user-attachments/assets/4ca1a52f-27a1-4808-b0f2-176cc31d79c5" />

7. Check **logs** of a running container
   
   <img width="994" height="359" alt="image" src="https://github.com/user-attachments/assets/39c5e6a8-9260-485c-8361-2876eac770d0" />

9. Run a command **inside** a running container
    
<img width="1040" height="731" alt="image" src="https://github.com/user-attachments/assets/52bd74fd-12a4-4926-b2bb-b17c83dec55e" />
---
