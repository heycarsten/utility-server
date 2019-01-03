# Personal Utility Server

This project builds a Docker image that can be accessed via SSH and used as a personal jump/utility server. A little personal host for stuff like port forwarding, running cron jobs, or getting access to a development environment from your phone or tablet, etc.

## Is this an abuse of Docker?

Maybe? I'm pretty new to the Docker thing and I'm liking it :slightly_smiling_face: I understand the whole "single service per container" concept, and I think it works really well for web applications (app frontends, background tasks, etc). I also think that _sometimes_ it makes sense to put a whole bunch of crap in one container and let'r rip! :laughing:

_I'm learning here! So if you see something weird [open an issue](https://github.com/heycarsten/utility-server/issues/new) and let me know :+1:_

## Usage

First, `cp .env.example .env`, then have a look in `.env` and modify it as you wish.

### 1. Initialize config files:

```bash
bin/init
```

_The command will check to see if there's a .env first and a bunch of other things. Go ahead and just give it a whirl :metal:_

### 2. Build the images:

```bash
bin/build
```

This will build the base image and the final image from that one.

### 3. Give it a whirl:

Fire up the container:

```bash
bin/start
```

SSH into the container:

```bash
ssh jmp@localhost -p PORT_RETURNED_BY_START_COMMAND
```

When you're done, shut it down:

```bash
bin/stop
```

If you want to run a one-off command on the container:

```bash
bin/exec ls -alh /home/jmp
```

### 4. Push the image to [Amazon ECR](https://aws.amazon.com/ecr/)

WIP: The goal of this is command is to be able to push these images into ECR. Learn how that all works, and then ultimately use Amazon ECS to host this jazzy personal utility server.

```bash
bin/push
```

### 5. Host it with [Amazon ECS](https://aws.amazon.com/ecs/)

WIP: Soon :heart:
