# Personal Utility Server

This project ultimately builds a Docker image that can be accessed via SSH and
used as a personal utility server. A little personal host for stuff like port
forwarding, running cron jobs, or getting access to a development environment
from your phone or tablet, etc.

## Is this an abuse of Docker?

Maybe? I'm pretty new to the Docker thing and I'm liking it
:slightly_smiling_face: I understand the whole "single service per container"
concept, and I think it works really well for web applications (app frontends,
background tasks, etc). I also think that _sometimes_ it makes sense to put a
whole bunch of crap in one container and let'r rip! :laughing:

_I'm learning here! So if you see something weird [open an issue](https://github.com/heycarsten/utility-server/issues/new) and let me know :+1:_

## Usage

From within the directory where you want to store configuration for your
utility server image (working directory):

### 1. Initialize config files:

```
utlsrv init
```

This will prompt you with a bunch of questions to set AWS configuration and some
questions about the utility server you want to create.

### 2. Build the images:

```
utlsrv build
```

This will build the base images and the final Docker image based on your
configuration.

### 3. Give it a whirl (locally):

Fire up the container:

```
utlsrv start
```

_This will boot your utility server locally using Docker Desktop, it will output
some information including the port that you can shell into your server with._

SSH into the container:

```
ssh jmp@localhost -p PORT_RETURNED_BY_START
```

When you're done, shut it down:

```
utlsrv stop
```

If you want to run a one-off command on the locally running container:

```
utlsrv exec ls -alh /home/jmp
```

### 4. Push the image to [Amazon ECR](https://aws.amazon.com/ecr/)

WIP: The goal of this is command is to be able to push the images to ECR.
I need to learn how that all works, and then ultimately use Amazon ECS to host
this jazzy thing.

```bash
utlsrv push
```

### 5. Host it with [Amazon ECS](https://aws.amazon.com/ecs/)

Probably will happen with the above step, perhaps also should have a `destroy`
command or something to shut it down. Soon :heart:
