# Docker for Beginners

This is a guide for those who are completely new to Docker. We will go through:

- What Docker and containers are  
- How to install Docker on Windows, Linux and Mac  
- How to create a Docker image  
- How to run your first container  

---

## What is Docker?

Think of Docker as a magic box that can pack everything needed to run a program. It contains:

- The actual program (e.g. a web server or a game)  
- All libraries and files the program needs  
- Settings and configurations  
- Any dependencies from the operating system  

When you open the box on a computer, the program works exactly the same, regardless of whether the computer is Windows, Mac or Linux. This makes it possible for the program to run smoothly across multiple environments.  

---

## What is a Container?

A container is the actual box when it runs. It is an isolation that makes sure the program inside the container does not interfere with other programs on the computer.  

Imagine this: You want to bake a cake, but you have several different recipes in the same kitchen. If you pour all the ingredients directly on the counter it can become a mess. A container is like its own little kitchen station where you can bake exactly according to the recipe without mixing with other projects.  

---

## What is a Docker Image?

A Docker image is like the recipe for your box. It describes:  

- Which files should be included  
- Which libraries are needed  
- How the program should start  

Once you have the recipe (image), you can create as many boxes (containers) as you want from it.  

### Example: Web server

You want to run a simple web server.  
- You create a Docker image that contains the web server and everything it needs.  
- When you run the image, a container is created – an isolated environment where the server starts and runs.  
- Need more web servers? Create more containers from the same image – they all work exactly the same.  

Advantages for beginners:  
- You don’t need to install and configure programs manually on your computer  
- You avoid problems with different versions of libraries or operating systems  
- You can share your Docker image with others and they can run the same program without issues  

---

## Installing Docker

### Windows

1. Download [Docker Desktop for Windows](https://www.docker.com/products/docker-desktop).  
2. Run the installer.  
3. Once installation is complete, start Docker Desktop and log in if you want.  
4. Open **PowerShell** and type:  
   ```powershell
   docker --version
   ```
   You should see the Docker version.  

**Note:** Windows 10 Home requires WSL2 (Windows Subsystem for Linux), which the installer will guide you through.  

---

### Mac OS

1. Download [Docker Desktop for Mac](https://www.docker.com/products/docker-desktop).  
2. Drag the Docker icon to the `Applications` folder.  
3. Start Docker and follow the setup wizard.  
4. Open **Terminal** and type:  
   ```bash
   docker --version
   ```
   You should see the Docker version.  

---

### Linux (Ubuntu example)

1. Open the terminal and type:  
   ```bash
   sudo apt update
   sudo apt install docker.io
   sudo systemctl start docker
   sudo systemctl enable docker
   ```
2. Check the installation:  
   ```bash
   docker --version
   ```
3. To run Docker without `sudo` (optional):  
   ```bash
   sudo usermod -aG docker $USER
   ```
   Log out and log back in.  

---

## Create a Docker Image

1. Create a file named `Dockerfile` (without extension) in an empty folder:  
   ```Dockerfile
   # Start from the official Python 3.11 slim image show where image come from. If you don´t specify it it will seaarch from docker. 
   FROM python:3.11-slim

   # Update packages and install security fixes
   RUN apt-get update &&     apt-get upgrade -y &&     apt-get clean &&     rm -rf /var/lib/apt/lists/*

    # Create working directory, this folder will not appear on your computer 
    # because it exists inside the container and has its own isolated filesystem
    WORKDIR /app

    # Copy the Python app
    COPY app.py /app/app.py

    # Start the app
    CMD ["python", "/app/app.py"]
   ```

2. Create a simple Python file `app.py`:  
   ```python
   print("Hello from Docker!")
   ```

3. Build your Docker image:  
   ```bash
   docker build -t my-python-app .
   ```

---

## Run Your First Container

Run the container based on the image you just built:  
```bash
docker run my-python-app
```

You should see:  
```
Hello from Docker!
```

Congratulations! You have just run your first Docker container.  

---

## Common Commands

| Command | Description |
|---------|-------------|
| `docker ps` | List all running containers |
| `docker ps -a` | List all containers, including stopped ones |
| `docker images` | List all images |
| `docker stop <container-id>` | Stop a container |
| `docker rm <container-id>` | Remove a container |
| `docker rmi <image-id>` | Remove an image |
| `docker pull python` | take down an image python from docker hub |

---

That’s all you need to get started with Docker as a beginner! 🚀  

---

## Security Tips!  

- Use official images and keep them updated  
- Docker team updates official images when new Python versions or security fixes are released.  
  Rebuild your image regularly, e.g. every week or month.  

- Minimize the number of packages in the container  
  The fewer packages, the smaller the attack surface.  
- Install only what your app needs.  
- Scan your image with security tools  

```bash
docker build -t my-python-app .
docker scan my-python-app
```

## Dockerhub 

https://hub.docker.com 

Here you can log in and create images and push to. 

### You can from your command line if you have WSL installed drag down a image direct from dockerhub 

```bash

docker pull python 

```





