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

**Verify:** Try adding a tab instead of spaces — what happens when you validate it?

---

### Task 4: Multi-line Strings
In `server.yaml`, add a `startup_script` field using:
1. The `|` block style (preserves newlines)
2. The `>` fold style (folds into one line)

Write in your notes: When would you use `|` vs `>`?

---

### Task 5: Validate Your YAML
1. Install `yamllint` or use an online validator
2. Validate both your YAML files
3. Intentionally break the indentation — what error do you get?
4. Fix it and validate again

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
