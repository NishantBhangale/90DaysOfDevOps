#  File Ownership Challenge (chown & chgrp)

## Users Created
- tokyo
- berlin
- nairobi
- professor

## Groups Created
- heist-team
- planners
- vault-team
- tech-team

## Files & Directories Created
- devops-file.txt
- app-logs/
- bank-heist/access-codes.txt
- bank-heist/blueprints.pdf
- bank-heist/escape-plan.txt
- heist-project/plans/strategy.conf
- heist-project/vault/gold.txt
- project-config.yml
- team-notes.txt

## Understanding Ownership

- Run ls -l in your home directory
- Identify the owner and group columns
- Check who owns your files
  
<img width="681" height="185" alt="image" src="https://github.com/user-attachments/assets/5e893307-74db-4264-a26c-1a739ac67a07" />


* Owner : The owner is usually the user who created the file or directory. Owner can change permission of file.
* Group : The group is a collection of users who share access to the file.

## Basic chown Operations

- Create file devops-file.txt
- Check current owner: ls -l devops-file.txt
- Change owner to berlin
- Verify the changes

<img width="776" height="185" alt="image" src="https://github.com/user-attachments/assets/573a631a-2a06-422d-a5f2-bb0c84062cab" />


## Basic chgrp Operations 

- Create file team-notes.txt
- Check current group: ls -l team-notes.txt
- Create group: sudo groupadd heist-team
- Change file group to heist-team
- Verify the change

<img width="819" height="71" alt="image" src="https://github.com/user-attachments/assets/344acc19-ebe7-46b5-bec1-d7f544a9cd85" />

## Combined Owner & Group Change

Using chown you can change both owner and group together:

- Create file project-config.yaml
- Change owner to professor AND group to heist-team (one command)
- Create directory app-logs/
- Change its owner to berlin and group to heist-team

<img width="1278" height="145" alt="image" src="https://github.com/user-attachments/assets/3712b0b2-40e7-4a41-b612-8cdbab850922" />


## Recursive Ownership

1. Create directory structure:
   ```
   mkdir -p heist-project/vault
   mkdir -p heist-project/plans
   touch heist-project/vault/gold.txt
   touch heist-project/plans/strategy.conf
   ```

2. Create group `planners`: `sudo groupadd planners`

3. Change ownership of entire `heist-project/` directory:
   - Owner: `professor`
   - Group: `planners`
   - Use recursive flag (`-R`)

4. Verify all files and subdirectories changed: `ls -lR heist-project/`

<img width="1278" height="231" alt="image" src="https://github.com/user-attachments/assets/f6a74b79-8032-46df-bc95-dbd0d268407a" />

### Task 6: Practice Challenge

1. Create users: `tokyo`, `berlin`, `nairobi` (if not already created)
2. Create groups: `vault-team`, `tech-team`
3. Create directory: `bank-heist/`
4. Create 3 files inside:
   ```
   touch bank-heist/access-codes.txt
   touch bank-heist/blueprints.pdf
   touch bank-heist/escape-plan.txt
   ```

5. Set different ownership:
   - `access-codes.txt` → owner: `tokyo`, group: `vault-team`
   - `blueprints.pdf` → owner: `berlin`, group: `tech-team`
   - `escape-plan.txt` → owner: `nairobi`, group: `vault-team`

**Verify:** `ls -l bank-heist/`

<img width="1387" height="193" alt="image" src="https://github.com/user-attachments/assets/64d5fd7e-9c23-4694-aa32-f31bad3f0049" />

## Commands Used

- View ownership : `ls -l filename`
- Change owner only : `sudo chown newowner filename`
- Change group only : `sudo chgrp newgroup filename`
- Change both owner and group : `sudo chown owner:group filename`
- Recursive change (directories) : `sudo chown -R owner:group directory/`
- Change only group with chown : `sudo chown :groupname filename` 

## What I Learned

* Managing User & Groups
* Understood file ownership
