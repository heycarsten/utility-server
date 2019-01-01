# utility-server

Builds a Docker image that can be accessed via SSH and used as a personal jump/utility server.

## Usage

Use of `IMAGE_TAG` and `CONTAINER_NAME` below should be substituted with a tag and name of your choice. My tag is `heycarsten/jmp:latest` and an example container name might be `utility_test`. These values can also be configured in a `.env` file placed in the project root. Have a look at the example.

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
