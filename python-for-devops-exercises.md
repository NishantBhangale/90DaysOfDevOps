# Python for DevOps — Coding Exercises

Practice problems only — no solutions. Do each one before moving to the next topic.

---

## FOUNDATION

### 1. Variables, data types, operators
- **Exercise 1:** Write a script with variables for `server_name`, `cpu_usage` (float), `is_healthy` (bool). Print a single formatted line: `"Server web-01: CPU 42.5%, Healthy: True"`.
- **Exercise 2:** Take a port number as a string `"8080"`, convert it to an int, and print whether it's above or below 1024 (privileged port check).

### 2. Conditionals & loops
- **Exercise 1:** Given `statuses = ["running", "stopped", "running", "error", "running"]`, loop through and print `"OK"` for running, `"DOWN"` for stopped/error.
- **Exercise 2:** Extend Exercise 1 to also count and print how many are `"running"` vs not.
- **Exercise 3:** Given `cpu_readings = [23, 45, 89, 92, 15, 76]`, print only the readings above 80 (simulate a high-CPU alert filter).

### 3. Functions & scope
- **Exercise 1:** Write `check_status(name, status)` that returns `"OK"` or `"DOWN"` instead of printing — then call it in a loop over a list of `(name, status)` tuples and print the results.
- **Exercise 2:** Write `average_cpu(readings)` that takes a list of numbers and returns the average. Add a check: if the list is empty, return `None` instead of crashing.

### 4. Core data structures
- **Exercise 1:** Given a list of instance dicts:
  ```
  instances = [
    {"id": "i-1", "state": "running", "type": "t2.micro"},
    {"id": "i-2", "state": "stopped", "type": "t2.large"},
    {"id": "i-3", "state": "running", "type": "t2.micro"},
  ]
  ```
  Write a function that returns only the `id`s of instances where `state == "running"`.
- **Exercise 2:** Write a function that takes the same list and returns a count of instances grouped by `type` (e.g., `{"t2.micro": 2, "t2.large": 1}`).
- **Exercise 3:** Given a set of currently-tagged instance IDs and a set of all instance IDs, find which instances are **untagged** (set difference).

### 5. String formatting & basic regex
- **Exercise 1:** Given the log line `"2026-08-09 14:32:01 ERROR Connection timeout to db-01"`, split it into date, time, level, and message using string splitting (no regex yet).
- **Exercise 2:** Redo Exercise 1 using the `re` module to extract the same four pieces with a single pattern.
- **Exercise 3:** Write a function that checks if a string matches a valid AWS region format (e.g., `us-west-1`, `ap-south-1`) using regex.

### 6. File I/O
- **Exercise 1:** Create a sample `app.log` file with 20 lines (mix of INFO/WARNING/ERROR). Write a script that reads it and writes only ERROR lines to `errors_only.log`.
- **Exercise 2:** Write a script that reads a file and prints the total number of lines and the number of blank lines.
- **Exercise 3:** Write a script that appends a new timestamped entry to a `deploy_history.log` file each time it runs (without overwriting previous entries).

### 7. Exception handling
- **Exercise 1:** Write a function `divide_safe(a, b)` that returns the division result, or a clear error message if `b` is 0, without crashing the program.
- **Exercise 2:** Write a function that tries to open a file that may not exist, catches the specific error, and prints `"Config file not found — using defaults"` instead of a stack trace.
- **Exercise 3:** Simulate an API call function that randomly "fails" (raise an exception 50% of the time using `random`). Wrap the call so the failure is caught and logged instead of crashing the script.

### 8. Environment variables & `.env`
- **Exercise 1:** Write a script that reads `AWS_REGION` from the environment; if it's not set, default to `"us-east-1"` and print which source was used.
- **Exercise 2:** Write a script that requires `DB_PASSWORD` to be set — if it's missing, exit with a clear error message instead of continuing.

---

## INTERMEDIATE

### 9. `argparse`
- **Exercise 1:** Build a CLI tool that accepts `--region` (required) and `--dry-run` (optional flag). Print what action it *would* take based on the inputs.
- **Exercise 2:** Add a `--log-level` argument that only accepts `INFO`, `WARNING`, or `ERROR` (use `choices`), and reject anything else with a helpful error.

### 10. `requests`
- **Exercise 1:** Use `requests` to GET a public test API (e.g., `https://httpbin.org/get`) and print the status code and response JSON.
- **Exercise 2:** Write a function `send_alert(message)` that POSTs a JSON payload to a test webhook URL and returns `True`/`False` based on whether it succeeded.
- **Exercise 3:** Handle the case where the request times out or the server is unreachable — catch it and print a friendly error.

### 11. `json` / `yaml` parsing
- **Exercise 1:** Given a JSON string representing a config, parse it into a dict and print a specific nested value (e.g., `config["database"]["port"]`).
- **Exercise 2:** Load a sample Kubernetes deployment YAML file, change the `image` tag under `spec.template.spec.containers[0].image`, and write the modified YAML back to a new file.
- **Exercise 3:** Write a function that converts a Python dict into pretty-printed JSON and also into YAML, so you can compare the two output formats.

### 12. `subprocess`
- **Exercise 1:** Use `subprocess` to run `echo hello` and capture/print its output.
- **Exercise 2:** Run a command that doesn't exist (e.g., `not-a-real-command`) and handle the failure gracefully, printing the error instead of crashing.
- **Exercise 3:** Run `kubectl get pods` (or simulate with any local CLI command), capture the output, and count how many lines contain `"Running"`.

### 13. `logging` module
- **Exercise 1:** Take any earlier script and replace every `print()` with an appropriate `logging` call (`.info()`, `.warning()`, `.error()`).
- **Exercise 2:** Configure logging to write to both the console AND a file (`app.log`) at the same time.
- **Exercise 3:** Add a `--verbose` CLI flag (using argparse from #9) that toggles the logging level between `INFO` and `DEBUG`.

### 14. `pathlib` / `os`
- **Exercise 1:** Write a script that lists all `.log` files in a given directory.
- **Exercise 2:** Extend it to print each file's size in KB and its last-modified date.
- **Exercise 3:** Write a script that finds and lists files not modified in the last 7 days (simulate with a few test files of different ages).

### 15. Basic OOP
- **Exercise 1:** Build a `LogAnalyzer` class with an `__init__` that takes a file path, and a method `count_by_level()` that returns a dict like `{"ERROR": 5, "WARNING": 2, "INFO": 40}`.
- **Exercise 2:** Add a method `get_errors()` that returns just the ERROR lines as a list.
- **Exercise 3:** Add a method `summary()` that returns a formatted string report combining the results of the other two methods.

### 16. Virtual environments & dependencies
- **Exercise 1:** Create a virtual environment for a new project folder, activate it, install `requests` and `pyyaml`, then generate a `requirements.txt`.
- **Exercise 2:** Delete the virtual environment, recreate it, and reinstall everything using only `requirements.txt` — confirm it matches.

---

## ADVANCED

### 17. boto3
- **Exercise 1:** Write a read-only script that lists all EC2 instances in your account with their `id`, `state`, and `type`.
- **Exercise 2:** Write a script that lists all Secrets Manager secrets and flags any not rotated/updated in the last 90 days.
- **Exercise 3:** Write a script that lists all S3 buckets and checks which ones do NOT have versioning enabled.

### 18. Kubernetes Python client
- **Exercise 1:** Write a script that lists all pods in a given namespace with their status.
- **Exercise 2:** Extend it to flag any pod not in `Running` or `Completed` state.
- **Exercise 3:** Write a script that counts pods per node.

### 19. Terraform + Python integration
- **Exercise 1:** Write a wrapper script that runs `terraform plan` via subprocess, captures the output, and prints just the summary line (e.g., "X to add, Y to change, Z to destroy").
- **Exercise 2:** Extend it to exit with a non-zero code if the plan shows any resources to be destroyed (a safety guard).

### 20. Idempotent automation scripts
- **Exercise 1:** Write a script that creates a local directory only if it doesn't already exist (no error on second run).
- **Exercise 2:** Simulate an S3 bucket creation script (using a local dict as a fake "AWS state") that checks if the bucket name already exists before "creating" it.

### 21. Parsing/summarizing logs at scale
- **Exercise 1:** Create 3-5 sample log files in a folder. Write a script that scans all of them and prints a combined count of log lines by level (INFO/WARNING/ERROR).
- **Exercise 2:** Extend it to rank and print the top 5 most frequent error messages across all files.

### 22. Retry logic & backoff
- **Exercise 1:** Write a function that simulates an unreliable API call (fails randomly) and retries up to 3 times before giving up, printing each attempt.
- **Exercise 2:** Add increasing delay between retries (e.g., 1s, 2s, 4s) instead of a fixed delay.

### 23. Config management patterns
- **Exercise 1:** Define what fields a valid config needs (e.g., `region`, `environment`, `log_level`). Write a validation function that checks a loaded dict against these requirements and lists what's missing.
- **Exercise 2:** Add type checking — e.g., `region` must be a string, `retries` must be an int — and report clear errors for mismatches.

---

## EXPERT

### 24. FastAPI
- **Exercise 1:** Build a FastAPI app with a single `/health` endpoint that returns `{"status": "ok"}`.
- **Exercise 2:** Add a `/logs/summary` endpoint that reuses your `LogAnalyzer` class (#15) and returns the error counts as JSON.

### 25. CI/CD scripting
- **Exercise 1:** Write a script that checks whether a `requirements.txt` file exists and is non-empty; exit with code 1 and an error message if not.
- **Exercise 2:** Write a script that validates a YAML config file's syntax and required fields, suitable as a pipeline pre-check step.

### 26. pytest
- **Exercise 1:** Write tests for your `average_cpu()` function (#3) covering a normal list, an empty list, and a list with one item.
- **Exercise 2:** Write tests for `LogAnalyzer.count_by_level()` using a small known sample log file, asserting the exact counts returned.
- **Exercise 3:** Write a test that checks your config validator (#23) correctly flags a missing required field.

### 27. Basic async (`asyncio`)
- **Exercise 1:** Write a synchronous version of a script that "checks" 5 fake services (using `time.sleep` to simulate latency) one at a time, and time how long it takes.
- **Exercise 2:** Rewrite it using `asyncio` to check all 5 concurrently, and compare the total time.

### 28. Packaging your own CLI tool
- **Exercise 1:** Take your log-analyzer script and package it with a `pyproject.toml` so it can be installed locally with `pip install -e .`.
- **Exercise 2:** Define an entry point so it can be run as a standalone command (e.g., `log-analyzer --path ./logs`) instead of `python script.py`.

### 29. Light AI/agent tooling
- **Exercise 1:** Write a script that reads an error log file and sends its content to an LLM API, asking it to summarize the likely root cause in one sentence.
- **Exercise 2:** Extend it into a simple LangChain/LangGraph flow: read log → summarize → suggest one remediation step, printed as a structured report.

---

## How to use this
Do exercises in order within each topic — later ones build on earlier ones. Don't check solutions/docs until you've attempted each one yourself; getting stuck is where the learning happens. Reuse code across sections where noted (e.g., #15's `LogAnalyzer` reappears in #21, #24, #26) — that's intentional, it mirrors how real projects build up.
