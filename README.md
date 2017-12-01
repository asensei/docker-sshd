# docker-sshd

A lightweight [OpenSSH][openssh] [Docker image][dockerhub_project] built atop [Alpine Linux][alpine_linux].

### Basic Usage

```bash
$ docker run --rm --publish=1080:22 asensei/docker-sshd # /entrypoint.sh
ssh-keygen: generating new host keys: RSA DSA ECDSA ED25519
Server listening on 0.0.0.0 port 22.
Server listening on :: port 22.

$ ssh username@localhost -p 1080
...
```

Arguments are passed to `sshd`. For example, to enable debug output:

```bash
$ docker run --rm --publish=1080:22 asensei/docker-sshd -o LogLevel=DEBUG
...
```

#### Use authorized keys

Mount the `authorized_keys` (read-only), then specify the destination path in `AUTHORIZED_KEYS`.
When the container starts, it makes a writable copy of the `authorized_keys` and it ensures that permissions on the file itself are correct.

```bash
docker run \
  -e AUTHORIZED_KEYS='/root/my_keys'
  -v /Users/john/auth_keys:/root/my_keys:ro
  -p 1080:22
  asensei/docker-sshd
```

[alpine_linux]:       https://hub.docker.com/_/alpine/
[dockerhub_project]:  https://hub.docker.com/r/sickp/alpine-sshd/
[openssh]:            http://www.openssh.com
