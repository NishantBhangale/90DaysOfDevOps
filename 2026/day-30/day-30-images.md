### Task 1: Docker Images
1. Pull the `nginx`, `ubuntu`, and `alpine` images from Docker Hub
   <img width="1040" height="466" alt="image" src="https://github.com/user-attachments/assets/95f2af18-ff2a-4d3b-acfb-2d0b326a4d41" />

3. List all images on your machine — note the sizes
   <img width="898" height="215" alt="image" src="https://github.com/user-attachments/assets/b4eae4dc-d5ca-438e-b86c-34046f88f207" />

5. Compare `ubuntu` vs `alpine` — why is one much smaller?
   
   Ubuntu: Larger (~160 MB) because it includes a more complete userspace, glibc, apt, and many standard utilities and libraries.
   Alpine: Much smaller (~13 MB) because it is designed as a minimal distribution, using lightweight musl libc and BusyBox with fewer packages and utilities.
   
7. Inspect an image — what information can you see?
   <img width="944" height="885" alt="image" src="https://github.com/user-attachments/assets/a8aa3c75-ec52-44b6-a1db-85bb05b17978" />

   
9. Remove an image you no longer need
   <img width="1547" height="96" alt="image" src="https://github.com/user-attachments/assets/93e6f7af-37b6-46bd-8ecc-2643df973b65" />

---

### Task 2: Image Layers
1. Run `docker image history nginx` — what do you see?
   
3. Each line is a **layer**. Note how some layers show sizes and some show 0B
   <img width="1098" height="449" alt="image" src="https://github.com/user-attachments/assets/60cd5e34-a069-4054-a97d-45f477fa183d" />

5. Write in your notes: What are layers and why does Docker use them?
   `A Docker layer is a read-only set of changes in a Docker image. Each instruction in a Dockerfile can create a new layer.
    Docker uses layers mainly for caching and reuse. If you build another image using the same layers,
    Docker can reuse them instead of downloading or rebuilding everything, making builds faster and more storage-efficient.
    Docker uses layers to enable caching, reuse, faster builds, and efficient storage.`
   
---

### Task 3: Container Lifecycle
Practice the full lifecycle on one container:
1. **Create** a container (without starting it)
  <img width="1573" height="115" alt="image" src="https://github.com/user-attachments/assets/0520f116-e8e3-43e9-8400-679ad1612d14" />

3. **Start** the container
   <img width="1532" height="115" alt="image" src="https://github.com/user-attachments/assets/d32c928f-2667-478a-a2ec-84ea5045709f" />
   
5. **Pause** it and check status
   <img width="1572" height="115" alt="image" src="https://github.com/user-attachments/assets/ee52572c-dc07-4613-97f6-aaee56c62762" />
   <img width="971" height="69" alt="image" src="https://github.com/user-attachments/assets/8582a810-0757-4a3d-9ba3-1bd2deded9f8" />
   
7. **Unpause** it
   <img width="1521" height="110" alt="image" src="https://github.com/user-attachments/assets/a91ff5bc-89c2-436e-811a-e309a105147f" />
   
9. **Stop** it
    <img width="1521" height="110" alt="image" src="https://github.com/user-attachments/assets/8d1573dc-fb3a-4ffa-9739-d0fe09f42d7b" />
    
11. **Restart** it
    <img width="1521" height="110" alt="image" src="https://github.com/user-attachments/assets/e0376ec0-a813-4d64-a9ce-af3d8dc8c48f" />
    
13. **Kill** it
    <img width="1545" height="110" alt="image" src="https://github.com/user-attachments/assets/32977a27-a773-4ec8-8712-47098f22b221" />

15. **Remove** it
    <img width="1464" height="118" alt="image" src="https://github.com/user-attachments/assets/86ff57b2-190d-45e9-bae4-e6f09a027dc6" />


Check `docker ps -a` after each step — observe the state changes.

---

### Task 4: Working with Running Containers
1. Run an Nginx container in detached mode
   <img width="1064" height="118" alt="image" src="https://github.com/user-attachments/assets/59efccdd-68bf-4feb-a71d-70bb7d2436c6" />

3. View its **logs**
   <img width="1064" height="494" alt="image" src="https://github.com/user-attachments/assets/3ea590e8-2e26-4e4c-a066-8c43a338db18" />

5. View **real-time logs** (follow mode)
   <img width="1064" height="653" alt="image" src="https://github.com/user-attachments/assets/0435fd7b-f51b-4613-aa0c-a34dcbd0f4e7" />

7. **Exec** into the container and look around the filesystem
   <img width="1468" height="106" alt="image" src="https://github.com/user-attachments/assets/f75e8446-3cf4-4fa5-ad54-e76ad056b328" />

   
9. Run a single command inside the container without entering it
   <img width="1468" height="106" alt="image" src="https://github.com/user-attachments/assets/632ed632-1a7f-4e73-ad54-2b3d78e15186" />
    
11. **Inspect** the container — find its IP address, port mappings, and mounts
   <img width="904" height="51" alt="image" src="https://github.com/user-attachments/assets/51f6fc3d-b34a-47f3-a074-892bf3d4f427" />
   <img width="875" height="142" alt="image" src="https://github.com/user-attachments/assets/2d88921a-b239-43d1-822b-46f2c476a20b" />
   <img width="875" height="32" alt="image" src="https://github.com/user-attachments/assets/01991159-c40d-4717-a714-ec7c01d908a5" />


---

### Task 5: Cleanup
1. Stop all running containers in one command
   <img width="875" height="54" alt="image" src="https://github.com/user-attachments/assets/af74bf60-9811-44bf-8979-c36c29885f87" />
   
3. Remove all stopped containers in one command
   <img width="875" height="162" alt="image" src="https://github.com/user-attachments/assets/7edce6e9-1d80-45c5-83e3-369cf14193f9" />
   <img width="875" height="273" alt="image" src="https://github.com/user-attachments/assets/742a6b08-16aa-401e-8551-f6915d972ab1" />

5. Remove unused images
   <img width="875" height="106" alt="image" src="https://github.com/user-attachments/assets/549ae771-a918-484f-9e71-877ef8c3ec71" />

7. Check how much disk space Docker is using
   
   <img width="597" height="133" alt="image" src="https://github.com/user-attachments/assets/805d6fa5-9150-4b4f-8327-283827b89660" />
