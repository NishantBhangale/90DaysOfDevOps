# Docker Cheat Sheet

A practical Docker reference for everyday development, debugging, and deployment tasks.

> Short commands I frequently use while working with containers, images, volumes, networks, and Docker Compose.

---

## 1. Container Commands

```bash
docker run -d --name my-container nginx
```

Run a container in detached mode.

```bash
docker ps
```

List running containers.

```bash
docker ps -a
```

List all containers, including stopped ones.

```bash
docker stop my-container
```

Stop a running container.

```bash
docker start my-container
```

Start an existing stopped container.

```bash
docker restart my-container
```

Restart a container.

```bash
docker rm my-container
```

Remove a stopped container.

```bash
docker exec -it my-container sh
```

Open a shell inside a running container.

```bash
docker exec -it my-container bash
```

Open Bash inside a container, if available.

```bash
docker logs my-container
```

View container logs.

```bash
docker logs -f my-container
```

Follow container logs in real time.

```bash
docker inspect my-container
```

View detailed container configuration.

---

## 2. Image Commands

```bash
docker build -t my-app:latest .
```

Build an image from a Dockerfile.

```bash
docker images
```

List locally available images.

```bash
docker pull nginx:latest
```

Download an image from a registry.

```bash
docker tag my-app:latest username/my-app:latest
```

Create a new tag for an image.

```bash
docker push username/my-app:latest
```

Push an image to a container registry.

```bash
docker image rm my-app:latest
```

Remove a local image.

```bash
docker image inspect my-app:latest
```

View image details and metadata.

---

## 3. Volume Commands

```bash
docker volume create app-data
```

Create a named volume.

```bash
docker volume ls
```

List Docker volumes.

```bash
docker volume inspect app-data
```

View volume details and mount information.

```bash
docker volume rm app-data
```

Remove a volume.

```bash
docker run -d -v app-data:/var/lib/data nginx
```

Mount a named volume inside a container.

> Be careful when deleting volumes because they may contain important application or database data.

---

## 4. Network Commands

```bash
docker network create app-net
```

Create a custom Docker network.

```bash
docker network ls
```

List Docker networks.

```bash
docker network inspect app-net
```

View network configuration and connected containers.

```bash
docker network connect app-net my-container
```

Connect a container to a network.

```bash
docker network disconnect app-net my-container
```

Disconnect a container from a network.

```bash
docker run -d --network app-net --name web nginx
```

Run a container on a specific network.

> Containers on the same user-defined network can communicate using container or service names.

---

## 5. Docker Compose Commands

```bash
docker compose up
```

Create and start all services.

```bash
docker compose up -d
```

Start services in the background.

```bash
docker compose up --build
```

Rebuild images and start the services.

```bash
docker compose down
```

Stop and remove containers and networks created by Compose.

```bash
docker compose ps
```

Show the status of Compose services.

```bash
docker compose logs -f
```

Follow logs from all services.

```bash
docker compose logs -f backend
```

Follow logs for one service.

```bash
docker compose build
```

Build or rebuild service images.

```bash
docker compose restart
```

Restart Compose services.

```bash
docker compose exec backend sh
```

Open a shell inside the running backend service.

---

## 6. Cleanup Commands

```bash
docker system df
```

Show Docker disk usage.

```bash
docker container prune
```

Remove stopped containers.

```bash
docker image prune
```

Remove unused dangling images.

```bash
docker image prune -a
```

Remove unused images not used by any container.

```bash
docker volume prune
```

Remove unused volumes.

```bash
docker network prune
```

Remove unused networks.

```bash
docker system prune
```

Remove unused containers, networks, and dangling images.

```bash
docker system prune -a
```

Remove all unused images, containers, networks, and build cache.

> Always review the cleanup prompt before confirming. Use `--volumes` only when you intentionally want to remove unused volumes.

---

## 7. Dockerfile Instructions

| Instruction  | Purpose                                                |
| ------------ | ------------------------------------------------------ |
| `FROM`       | Selects the base image.                                |
| `RUN`        | Executes a command while building the image.           |
| `COPY`       | Copies files from the build context into the image.    |
| `WORKDIR`    | Sets the working directory for following instructions. |
| `EXPOSE`     | Documents the port the application listens on.         |
| `CMD`        | Defines the default command used to start a container. |
| `ENTRYPOINT` | Defines the main executable for the container.         |

### Example Dockerfile

```dockerfile
FROM node:24-alpine

WORKDIR /app

COPY package*.json ./

RUN npm ci

COPY . .

EXPOSE 5000

CMD ["node", "dist/server.js"]
```

### CMD vs ENTRYPOINT

```dockerfile
CMD ["node", "dist/server.js"]
```

Provides the default command, which can be overridden.

```dockerfile
ENTRYPOINT ["node", "dist/server.js"]
```

Defines the main executable that normally remains fixed.

---

## Useful Daily Commands

```bash
docker version
```

Check the Docker client and server versions.

```bash
docker info
```

Display Docker engine information.

```bash
docker stats
```

Monitor container CPU, memory, and network usage.

```bash
docker cp my-container:/app/logs.txt .
```

Copy a file from a container to the host.

```bash
docker cp ./config.json my-container:/app/config.json
```

Copy a file from the host into a container.

```bash
docker rename old-name new-name
```

Rename a container.

---

## Quick Troubleshooting

```bash
docker ps -a
```

Check whether a container exited.

```bash
docker logs my-container
```

Read the application error logs.

```bash
docker inspect my-container
```

Check environment variables, mounts, ports, and networks.

```bash
docker compose config
```

Validate and view the resolved Compose configuration.

```bash
docker network inspect app-net
```

Confirm whether containers are connected to the same network.

```bash
docker system df
```

Check whether Docker is using too much disk space.

---

## Notes

* Use service names such as `postgresql` instead of `localhost` when connecting between Docker containers.
* Use `docker compose up --build` after changing a Dockerfile.
* Use `docker compose logs -f <service>` when debugging one service.
* Avoid using `docker system prune -a` on production machines without checking what will be removed.
* Never commit passwords, API keys, database credentials, or JWT secrets to Git.
