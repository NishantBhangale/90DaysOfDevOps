# Linux User & Group Management

## Challenge Tasks

### Task 1: Create Users (20 minutes)

Create three users with home directories and passwords:
- `tokyo` : `sudo adduser tokyo`
- `berlin` : `sudo adduser berlin`
- `professor` : `sudo adduser professor`

**Verify:** Check `/etc/passwd` and `/home/` directory

cat /etc/passwd
<img width="1383" height="140" alt="image" src="https://github.com/user-attachments/assets/b684de03-ab11-4430-816e-6feab7952eb7" />

ls /home
<img width="847" height="82" alt="image" src="https://github.com/user-attachments/assets/c7b9e6bf-09f3-4499-84dc-d8c5ae62c304" />

---

### Task 2: Create Groups (10 minutes)

Create two groups:
- `developers` : `sudo groupadd developers`
- `admins` : `sudo groupadd admins`

**Verify:** Check `/etc/group`

cat /etc/group

<img width="1383" height="102" alt="image" src="https://github.com/user-attachments/assets/52542c29-06ae-42f8-bc47-cca705a811a5" />

---

### Task 3: Assign to Groups (15 minutes)

Assign users:
- `tokyo` → `developers` : `sudo usermod -aG developers tokyo`
- `berlin` → `developers` + `admins` (both groups) : `sudo usermod -aG developers berlin && sudo usermod -aG admins berlin`
- `professor` → `admins` : `sudo usermod -aG admins professor`

**Verify:** Use appropriate command to check group membership
- `id tokyo`
- `id berlin`
- `id professor`

<img width="1383" height="208" alt="image" src="https://github.com/user-attachments/assets/0e87935b-87f1-4158-b1d4-39ff1133fad3" />

---

### Task 4: Shared Directory (20 minutes)

1. Create directory: `/opt/dev-project` : `mkdir /opt/dev-project`
2. Set group owner to `developers` : `sudo chgrp developers /opt/dev-project/`
3. Set permissions to `775` (rwxrwxr-x) : `sudo chmod 775 /opt/dev-project/`
4. Test by creating files as `tokyo` and `berlin` : `touch tokyo && touch berlin`

**Verify:** Check permissions and test file creation

<img width="1189" height="141" alt="image" src="https://github.com/user-attachments/assets/a0a71d82-1bed-4f47-967e-8c84fb501915" />

---

### Task 5: Team Workspace (20 minutes)

1. Create user `nairobi` with home directory : `sudo useradd -m nairobi`
   
   <img width="847" height="82" alt="image" src="https://github.com/user-attachments/assets/e192d982-1e7e-4a8d-a516-a2a4a685ef29" />

2. Create group `project-team` : `groupadd project-team`
   
3. Add `nairobi` and `tokyo` to `project-team` : ``
   <img width="1189" height="94" alt="image" src="https://github.com/user-attachments/assets/5611bee5-51e2-4580-b227-c531cd481751" />

4. Create `/opt/team-workspace` directory : `sudo mkdir team-workspace`

5. Set group to `project-team`, permissions to `775` : `sudo chgrp project-team /opt/team-workspace/ && sudo chmod 775 /opt/team-workspace/`
   <img width="1189" height="247" alt="image" src="https://github.com/user-attachments/assets/b98750b1-3535-4eea-8dcf-d3366fcf044b" />

6. Test by creating file as `nairobi` : `su nairobi` and `touch text`
  <img width="1189" height="166" alt="image" src="https://github.com/user-attachments/assets/fcc83886-25c6-4d77-b20a-f50a6a827349" />

