## Challenge Tasks

### Task 1: Key-Value Pairs
Create `person.yaml` that describes yourself with:
- `name`
- `role`
- `experience_years`
- `learning` (a boolean)

**Verify:** Run `cat person.yaml` — does it look clean? No tabs?

<img width="423" height="469" alt="image" src="https://github.com/user-attachments/assets/bb1111c7-2ae1-4e71-8731-97072e5189dc" />

---

### Task 2: Lists
Add to `person.yaml`:
- `tools` — a list of 5 DevOps tools you know or are learning
- `hobbies` — a list using the inline format `[item1, item2]`

<img width="469" height="172" alt="image" src="https://github.com/user-attachments/assets/541182ba-65b8-42bf-a7d2-b587065d6d2b" />

Write in your notes: What are the two ways to write a list in YAML?
1. Block Style : This is the most common and readable method for multi-line lists. Each item is placed on a new line starting with a hyphen (-) and a space.
2. Flow Style (Inline Format) : This method is useful when you want to keep your YAML file compact or inline. The items are enclosed in square brackets [...] and separated by commas.

   <img width="243" height="109" alt="image" src="https://github.com/user-attachments/assets/446837bb-ef5f-4053-8ba4-6c45d0daa69d" />
   1st one is block style and 2nd is flow style

---

### Task 3: Nested Objects
Create `server.yaml` that describes a server:
- `server` with nested keys: `name`, `ip`, `port`
- `database` with nested keys: `host`, `name`, `credentials` (nested further: `user`, `password`)

  <img width="211" height="234" alt="image" src="https://github.com/user-attachments/assets/a6969101-23e2-48fa-9129-db4e2e9b9145" />
  <img width="647" height="416" alt="image" src="https://github.com/user-attachments/assets/5f2f3bbc-2ab8-408c-baae-1f82f700125d" />


**Verify:** Try adding a tab instead of spaces — what happens when you validate it?
- In YAML, using a tab character for indentation results in a syntax error because the official YAML specification strictly prohibits tabs for indentation.

---

### Task 4: Multi-line Strings
In `server.yaml`, add a `startup_script` field using:
1. The `|` block style (preserves newlines)
2. The `>` fold style (folds into one line)

keys should be unique as duplicate not allowed
<img width="822" height="429" alt="image" src="https://github.com/user-attachments/assets/20ee631e-88f0-4cf5-b048-553bb2321868" />

Corrected
<img width="656" height="412" alt="image" src="https://github.com/user-attachments/assets/1be6205a-747e-4a41-b1e8-386cbe4e486b" />

Write in your notes: When would you use `|` vs `>`?
1. Use `| ` block style for Code and Scripts, SQL quesries, Markdown or Templates.
2. Use `>` folded style for Long Descriptions, Error or Status Messages.
---

### Task 5: Validate Your YAML
1. Install `yamllint` or use an online validator
2. Validate both your YAML files
3. Intentionally break the indentation — what error do you get?
4. Fix it and validate again
- done
  server.yaml
  ```
   server: 
     name: database
     ip: 172.23.44.4
     port: 3304
   
   database:
     host: postgres
     name: secure-postgres
     credentials:
       user: admin 
       password: admin123
   
   startup_script: >
     This is a very long sentence
     that spans multiple lines in the 
     YAML file, but will be read as a 
     single continuous line by the parser.
   
   startup_script_1: |
     def hello_world():
         print("Hello, YAML!")
  ```
  person.yaml
     ```
   name: Nishant
   role: QA engineer
   experience_years: 5
   learning: Devops
   tools:
     - jenkins
     - docker
     - ansible
     - Terraform
     - Helm
   hobbies: [reading, playing, dancing]
     ```
---

### Task 6: Spot the Difference
Read both blocks and write what's wrong with the second one:

```yaml
# Block 1 - correct
name: devops
tools:
  - docker
  - kubernetes
```

```yaml
# Block 2 - broken
name: devops
tools:
- docker
  - kubernetes
```
- Block 2 fails because of inconsistent indentation and a stray tab character, which violate YAML's strict whitespace rules for lists. Specifically, `- docker` is not properly indented underneath the `tools:` key, while `- kubernetes` uses mismatched spacing, causing the parser to throw a syntax error instead of recognizing them as a unified list.
