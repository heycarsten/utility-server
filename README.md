# utility-server

Builds a Docker image that can be accessed via SSH and used as a personal jump/utility server. A little personal host for stuff like port forwarding, running cron jobs, getting access to a development environment from your phone or tablet, etc.

## Is this an abuse of Docker?

Maybe? I'm pretty new to the Docker thing and I'm liking it :slightly_smiling_face: I understand the whole "single service per container" concept, and I think it works really well for web applications (app frontends, background tasks, etc). I also think that _sometimes_ it makes sense to put a whole bunch of crap in one container and let'r rip! :laughing:

## Usage

First, There's a bunch of helper commands in `bin`, they all accept arguments setting values in a `.env` file.

### 1. Initialize config files using:

```bash
bin/init
```

### 2. Build the image:

```bash
bin/build IMAGE_TAG # Mine is heycarsten/jmp:latest
```

### 3. Give it a whirl:

```bash
bin/start IMAGE_TAG CONTAINER_NAME
```

```bash
ssh jmp@localhost -p PORT_RETURNED_BY_START_COMMAND
```

```bash
bin/stop
```

### 4. Push the image to Amazon ECR

```bash
bin/push
```
