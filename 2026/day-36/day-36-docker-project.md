## Challenge Tasks

### Task 1: Pick Your App
Choose **one** of these (or use your own project):
- A **Python Flask/Django** app with a database
- A **Node.js Express** app with MongoDB
- A **static website** served by Nginx with a backend API
- Any app from your GitHub that doesn't have Docker yet

  picked [ Hozn - Real Estate** is a **Full-Stack** real estate website built with **React, Next.js, TypeScript**, and a **Node.js (Express) backend ]
  url : https://github.com/NishantBhangale/Hozn-RealEstate-Fullstack/tree/main 

If you don't have an app, clone a simple open-source one and Dockerize it.

---

### Task 2: Write the Dockerfile
1. Create a Dockerfile for your application
2. Use a **multi-stage build** if applicable
3. Use a **non-root user**
4. Keep the image **small** — use alpine or slim base images
5. Add a `.dockerignore` file

Build and test it locally.
Backend dockerfile
  ```
  ####--- Stage 1: Build the application ---####
  
  FROM node:24-alpine AS builder
  
  WORKDIR /app
  
  COPY package*.json ./
  
  RUN npm ci
  
  COPY . .
  
  RUN chmod +x node_modules/.bin/tsc
  
  RUN npm run build
  
  
  ####--- Stage 2: Run the application ---####
  
  FROM node:24-alpine
  
  WORKDIR /app
  
  COPY package*.json ./
  
  RUN npm ci --omit=dev
  
  COPY --from=builder /app/dist ./dist
  
  USER node
  
  EXPOSE 5000
  
  CMD ["node", "dist/server.js"]
  ```
frontend dockerfile
      
      # ---------- Stage 1: Build ----------
      FROM node:24-alpine AS builder
      
      WORKDIR /app
      
      COPY package*.json ./
      
      RUN npm ci
      
      COPY . .
      
      RUN npm run build
      # ---------- Stage 2: Run Next.js ----------
      FROM node:24-alpine AS runner
      
      WORKDIR /app
      
      ENV NODE_ENV=production
      
      COPY package*.json ./
      
      RUN npm ci --omit=dev
      
      COPY --from=builder /app/.next ./.next
      COPY --from=builder /app/public ./public
      COPY --from=builder /app/next.config.js ./next.config.js
      
      USER node
      
      EXPOSE 3000
      
      CMD ["npm", "start"]
    ```
---

### Task 3: Add Docker Compose
Write a `docker-compose.yml` that includes:
1. Your **app** service (built from Dockerfile)
2. A **database** service (Postgres, MySQL, MongoDB — whatever your app needs)
3. **Volumes** for database persistence
4. A **custom network**
5. **Environment variables** for configuration (use `.env` file)
6. **Healthchecks** on the database

Run `docker compose up` and verify everything works together.

  ```
  services:
  postgresql:
    image: postgres:16
    container_name: postgresql
    restart: unless-stopped
    environment:
      POSTGRES_USER: admin
      POSTGRES_PASSWORD: admin123
      POSTGRES_DB: realestate
    volumes:
      - hozn_data:/var/lib/postgresql/data
    ports:
      - "${POSTGRES_PORT}:5432"
    healthcheck:
      test: ["CMD-SHELL", "pg_isready -U admin -d realestate"]
      interval: 10s
      timeout: 5s
      retries: 5
      start_period: 10s
    networks:
      - hozn-net
  
  backend:
    build: ./real-estate-backend
    container_name: hozn-backend
    env_file:
      - ./real-estate-backend/.env
    ports:
      - "${BACKEND_PORT}:5000"
    depends_on:
      postgresql:
        condition: service_healthy
    networks:
      - hozn-net
  
  frontend:
    build: ./
    container_name: hozn-frontend
    env_file:
      - ./.env
    ports:
      - "${FRONTEND_PORT}:3000"
    depends_on:
      - backend
    networks:
      - hozn-net
volumes:
  hozn_data:  
    name: hozn_data
networks:
  hozn-net:
    name: hozn-net
    driver: bridge
  ```
  <img width="1444" height="337" alt="image" src="https://github.com/user-attachments/assets/b71ec4dc-f69f-4103-ae3e-4c59c35274a2" />

---

### Task 4: Ship It
1. Tag your app image
2. Push it to Docker Hub
3. Share the Docker Hub link
4. Write a `README.md` in your project with:
   - What the app does
   - How to run it with Docker Compose
   - Any environment variables needed
   --- done
---

### Task 5: Test the Whole Flow
1. Remove all local images and containers
2. Pull from Docker Hub and run using only your compose file
3. Does it work fresh? If not — fix it until it does
    --- done
---
