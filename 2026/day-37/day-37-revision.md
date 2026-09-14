# Docker Cheat Sheet

A practical reference for everyday Docker development, debugging, and deployment.

This cheat sheet contains commonly used Docker commands, Dockerfile instructions, and quick-fire interview questions.

---

## Docker Self-Assessment

### Status Guide

- **Can do** — I can perform the task without much help.
- **Shaky** — I understand the concept but need more practice.
- **Haven't done** — I still need to learn and practice it.

| Topic | Status |
|---|---|
| Run a container from Docker Hub — interactive and detached | **Can do** |
| List, stop, and remove containers and images | **Can do** |
| Explain image layers and how caching works | **Shaky** |
| Write a Dockerfile from scratch using `FROM`, `RUN`, `COPY`, `WORKDIR`, and `CMD` | **Can do** |
| Explain `CMD` vs `ENTRYPOINT` | **Shaky** |
| Build and tag a custom image | **Can do** |
| Create and use named volumes | **Can do** |
| Use bind mounts | **Shaky** |
| Create custom networks and connect containers | **Can do** |
| Write a `docker-compose.yml` for a multi-container application | **Can do** |
| Use environment variables and `.env` files in Compose | **Can do** |
| Write a multi-stage Dockerfile | **Can do** |
| Push an image to Docker Hub | **Can do** |
| Use healthchecks and `depends_on` | **Can do** |

---

# 1. Container Commands

| Command | Use |
|---|---|
| `docker run nginx` | Run a container from an image. |
| `docker run -it ubuntu bash` | Run a container interactively. |
| `docker run -d nginx` | Run a container in detached mode. |
| `docker run --name web nginx` | Run a container with a custom name. |
| `docker run -p 8080:80 nginx` | Map host port `8080` to container port `80`. |
| `docker ps` | List running containers. |
| `docker ps -a` | List all containers. |
| `docker stop web` | Stop a running container. |
| `docker start web` | Start a stopped container. |
| `docker restart web` | Restart a container. |
| `docker rm web` | Remove a stopped container. |
| `docker rm -f web` | Force-remove a running container. |
| `docker exec -it web sh` | Open a shell inside a running container. |
| `docker logs web` | View container logs. |
| `docker logs -f web` | Follow container logs in real time. |
| `docker inspect web` | Display detailed container information. |
| `docker stats` | Show live resource usage of containers. |
| `docker rename old-name new-name` | Rename a container. |

---

# 2. Image Commands

| Command | Use |
|---|---|
| `docker image ls` | List local Docker images. |
| `docker pull nginx:latest` | Download an image from Docker Hub. |
| `docker build -t my-app:latest .` | Build an image from a Dockerfile. |
| `docker build -t my-app:1.0 .` | Build and tag an image with a version. |
| `docker tag my-app:latest username/my-app:latest` | Create a registry-ready image tag. |
| `docker push username/my-app:latest` | Push an image to Docker Hub. |
| `docker image inspect my-app:latest` | View image metadata. |
| `docker image rm my-app:latest` | Remove a local image. |
| `docker image rm -f my-app:latest` | Force-remove an image. |
| `docker history my-app:latest` | View image layers and build history. |

### Common Docker Hub Workflow

```bash
docker login
docker build -t username/my-app:1.0 .
docker push username/my-app:1.0
```

---

# 3. Volume Commands

Volumes are used to persist data outside a container's writable layer.

| Command | Use |
|---|---|
| `docker volume create app-data` | Create a named volume. |
| `docker volume ls` | List Docker volumes. |
| `docker volume inspect app-data` | Inspect a volume. |
| `docker volume rm app-data` | Remove a volume. |
| `docker volume prune` | Remove unused volumes. |
| `docker run -v app-data:/app/data nginx` | Mount a named volume. |

### Named Volume Example

```bash
docker volume create postgres-data

docker run -d \
  --name postgresql \
  -v postgres-data:/var/lib/postgresql/data \
  postgres:16
```

> Be careful when deleting volumes because they may contain database data.

---

# 4. Bind Mount Commands

Bind mounts connect a host directory or file directly to a container.

```bash
docker run -it \
  -v "$(pwd):/app" \
  node:24-alpine sh
```

| Command | Use |
|---|---|
| `-v "$(pwd):/app"` | Mount the current host directory into `/app`. |
| `-v ./config:/app/config` | Mount a relative host directory. |
| `--mount type=bind,source="$(pwd)",target=/app` | Use the more explicit mount syntax. |

### Named Volume vs Bind Mount

| Named Volume | Bind Mount |
|---|---|
| Managed by Docker | Managed by the host filesystem |
| Good for databases and persistent application data | Good for source code and local development |
| Does not require a specific host path | Requires a host path |
| Example: `app-data:/app/data` | Example: `./src:/app/src` |

---

# 5. Network Commands

Custom networks allow containers to communicate with each other.

| Command | Use |
|---|---|
| `docker network create app-net` | Create a custom network. |
| `docker network ls` | List Docker networks. |
| `docker network inspect app-net` | Inspect a network. |
| `docker network connect app-net web` | Connect a container to a network. |
| `docker network disconnect app-net web` | Disconnect a container from a network. |
| `docker network rm app-net` | Remove a network. |

### Network Example

```bash
docker network create app-net

docker run -d \
  --name web \
  --network app-net \
  nginx

docker run -it \
  --name client \
  --network app-net \
  busybox sh
```

Containers on the same custom network can communicate using container names.

For example:

```text
postgresql:5432
```

Inside Docker, avoid using:

```text
localhost
127.0.0.1
```

Those refer to the current container itself.

---

# 6. Docker Compose Commands

| Command | Use |
|---|---|
| `docker compose up` | Create and start all services. |
| `docker compose up -d` | Start services in detached mode. |
| `docker compose up --build` | Rebuild images and start services. |
| `docker compose down` | Stop and remove Compose containers and networks. |
| `docker compose down -v` | Stop containers and remove Compose volumes. |
| `docker compose ps` | Show the status of Compose services. |
| `docker compose logs` | View logs from all services. |
| `docker compose logs -f` | Follow logs from all services. |
| `docker compose logs -f backend` | Follow logs for one service. |
| `docker compose build` | Build service images. |
| `docker compose restart` | Restart services. |
| `docker compose exec backend sh` | Open a shell inside the backend service. |
| `docker compose config` | Validate and display the resolved Compose configuration. |

### Common Compose Workflow

```bash
docker compose up --build -d
docker compose ps
docker compose logs -f
docker compose down
```

### Example `.env` Usage

```yaml
services:
  backend:
    build: ./backend
    env_file:
      - ./backend/.env
    ports:
      - "5000:5000"
```

Example `.env` file:

```env
PORT=5000
DATABASE_URL=postgresql://admin:password@postgresql:5432/realestate
JWT_SECRET=replace-with-a-secure-secret
```

> Do not commit `.env` files containing passwords, API keys, or JWT secrets.

---

# 7. Cleanup Commands

| Command | Use |
|---|---|
| `docker system df` | Show Docker disk usage. |
| `docker container prune` | Remove stopped containers. |
| `docker image prune` | Remove dangling images. |
| `docker image prune -a` | Remove unused images. |
| `docker volume prune` | Remove unused volumes. |
| `docker network prune` | Remove unused networks. |
| `docker builder prune` | Remove unused build cache. |
| `docker system prune` | Remove unused containers, networks, images, and cache. |
| `docker system prune -a` | Remove all unused images and other unused Docker data. |
| `docker system prune -a --volumes` | Also remove unused volumes. |

> Always review cleanup commands carefully. Removing volumes can permanently delete database data.

---

# 8. Dockerfile Instructions

| Instruction | Purpose |
|---|---|
| `FROM` | Selects the base image. |
| `RUN` | Executes a command during image creation. |
| `COPY` | Copies files from the build context into the image. |
| `ADD` | Copies files and supports additional features such as archive extraction. |
| `WORKDIR` | Sets the working directory for following instructions. |
| `ENV` | Defines environment variables inside the image. |
| `EXPOSE` | Documents the port used by the application. |
| `CMD` | Defines the default command used to start the container. |
| `ENTRYPOINT` | Defines the main executable for the container. |
| `ARG` | Defines a build-time variable. |
| `USER` | Sets the user used to run commands and the application. |
| `VOLUME` | Declares a mount point for persistent data. |

---

## Dockerfile Example

```dockerfile
FROM node:24-alpine

WORKDIR /app

COPY package*.json ./

RUN npm ci

COPY . .

EXPOSE 5000

CMD ["node", "dist/server.js"]
```

---

## Multi-Stage Dockerfile Example

Multi-stage builds separate the build environment from the production runtime.

Benefits:

- Smaller final images
- Fewer unnecessary dependencies
- Better security
- Cleaner production containers

```dockerfile
# ---------- Build Stage ----------
FROM node:24-alpine AS builder

WORKDIR /app

COPY package*.json ./

RUN npm ci

COPY . .

RUN npm run build


# ---------- Runtime Stage ----------
FROM node:24-alpine AS runner

WORKDIR /app

ENV NODE_ENV=production

COPY package*.json ./

RUN npm ci --omit=dev

COPY --from=builder /app/dist ./dist

EXPOSE 5000

CMD ["node", "dist/server.js"]
```

---

# 9. CMD vs ENTRYPOINT

## CMD

`CMD` defines the default command for a container.

```dockerfile
CMD ["node", "dist/server.js"]
```

The command can be overridden when starting the container.

```bash
docker run my-app node dist/other.js
```

## ENTRYPOINT

`ENTRYPOINT` defines the main executable for a container.

```dockerfile
ENTRYPOINT ["node", "dist/server.js"]
```

It is normally used when the container should always run a specific executable.

### Simple Difference

```text
CMD        = Default command
ENTRYPOINT = Main executable
```

They can also be used together:

```dockerfile
ENTRYPOINT ["node"]
CMD ["dist/server.js"]
```

This runs:

```bash
node dist/server.js
```

---

# 10. Image Layers and Build Cache

Docker images are built in layers.

Each instruction such as `RUN`, `COPY`, and `ADD` may create a new layer.

Example:

```dockerfile
FROM node:24-alpine

WORKDIR /app

COPY package*.json ./

RUN npm ci

COPY . .

RUN npm run build
```

Docker reuses cached layers when the instruction and its required files have not changed.

A common optimization is to copy package files before copying the entire source code:

```dockerfile
COPY package*.json ./
RUN npm ci

COPY . .
```

This allows Docker to reuse the dependency installation layer when only application source code changes.

View image layers with:

```bash
docker history my-app:latest
```

---

# 11. Quick-Fire Questions

## 1. What is the difference between an image and a container?

A Docker image is a read-only template containing application code, dependencies, libraries, and configuration.

A container is a running or stopped instance created from an image.

```text
Image     = Blueprint
Container = Instance of the blueprint
```

---

## 2. What happens to data inside a container when you remove it?

Data stored in the container's writable layer is removed when the container is deleted.

Data stored in a named volume or bind mount remains available.

```bash
docker rm my-container
```

For persistent data, use a volume:

```bash
docker run -v app-data:/app/data my-image
```

---

## 3. How do two containers on the same custom network communicate?

They communicate using the container or service name as the hostname.

Example:

```text
postgresql:5432
```

A backend container can connect to a PostgreSQL container using:

```env
DATABASE_URL=postgresql://admin:password@postgresql:5432/realestate
```

Do not use `localhost` for container-to-container communication.

---

## 4. What does `docker compose down -v` do differently from `docker compose down`?

```bash
docker compose down
```

Stops and removes Compose containers and networks.

```bash
docker compose down -v
```

Also removes the named volumes created by Compose.

> This can delete persistent database data.

---

## 5. Why are multi-stage builds useful?

Multi-stage builds separate compilation from runtime.

They help to:

- Reduce final image size
- Keep development dependencies out of production
- Improve security
- Make production images cleaner
- Build TypeScript, React, and Next.js applications efficiently

---

## 6. What is the difference between `COPY` and `ADD`?

`COPY` copies files and directories into the image.

```dockerfile
COPY package*.json ./
```

`ADD` can also copy files, but supports additional features such as extracting local tar archives.

For normal file copying, prefer `COPY` because it is simpler and more predictable.

---

## 7. What does `-p 8080:80` mean?

```bash
docker run -p 8080:80 nginx
```

The format is:

```text
-p HOST_PORT:CONTAINER_PORT
```

Therefore:

```text
8080 = Port on the host machine
80   = Port inside the container
```

The application is accessed at:

```text
http://localhost:8080
```

---

## 8. How do you check how much disk space Docker is using?

Use:

```bash
docker system df
```

It shows Docker disk usage for:

- Images
- Containers
- Local volumes
- Build cache

---

# 12. Useful Troubleshooting Commands

| Command | Use |
|---|---|
| `docker ps -a` | Check whether a container exited. |
| `docker logs container-name` | Read application error logs. |
| `docker inspect container-name` | Check environment variables, ports, mounts, and networks. |
| `docker compose config` | Validate the Compose configuration. |
| `docker compose logs -f backend` | Follow backend logs. |
| `docker network inspect app-net` | Check connected containers. |
| `docker system df` | Check Docker disk usage. |
| `docker exec -it container-name sh` | Enter a running container. |
| `docker port container-name` | Show published port mappings. |
| `docker top container-name` | Show processes running inside a container. |

---

# 13. Important Notes

- Use service names such as `postgresql` instead of `localhost` between Docker containers.
- Use `docker compose up --build` after changing a Dockerfile.
- Use `docker compose logs -f <service>` when debugging a specific service.
- Use named volumes for persistent database data.
- Use bind mounts mainly for local development and source-code sharing.
- Avoid running `docker system prune -a` on production machines without checking the impact.
- Never commit passwords, API keys, database credentials, or JWT secrets to Git.
- Add `.env`, `node_modules`, `dist`, and `.next` to `.gitignore`.
- Use multi-stage builds for production applications whenever possible.

---

## Final Practice Task

Build and run a simple Node.js application using Docker:

```bash
docker build -t my-node-app:1.0 .
docker run -d --name my-node-container -p 5000:5000 my-node-app:1.0
docker ps
docker logs -f my-node-container
```

Clean up after practice:

```bash
docker stop my-node-container
docker rm my-node-container
docker image rm my-node-app:1.0
```

---

**Day 37 completed — Docker commands, Dockerfiles, images, containers, volumes, networks, and Compose practice.**
