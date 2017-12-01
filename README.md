# docker-sshd

A lightweight [OpenSSH][openssh] [Docker image][dockerhub_project] built atop [Alpine Linux][alpine_linux].

### Basic Usage

```bash
$ docker run --rm --publish=1080:22 asensei/docker-sshd # /entrypoint.sh
ssh-keygen: generating new host keys: RSA DSA ECDSA ED25519
Server listening on 0.0.0.0 port 22.
Server listening on :: port 22.

$ ssh username@localhost -p 1080
```

Any arguments are passed to `sshd`. For example, to enable debug output:

```bash
$ docker run --rm --publish=1080:22 asensei/docker-sshd -o LogLevel=DEBUG
...
```

#### Use authorized keys

In order to use your SSH key, simply mount them to:
```
/root/.ssh/authorized_keys
```

[alpine_linux]:       https://hub.docker.com/_/alpine/
[dockerhub_project]:  https://hub.docker.com/r/sickp/alpine-sshd/
[openssh]:            http://www.openssh.com
