[![Codacy Badge](https://api.codacy.com/project/badge/Grade/739128f2994b4c52a103258a52c2c10e)](https://app.codacy.com/app/OlegGorJ/bastion-image?utm_source=github.com&utm_medium=referral&utm_content=OlegGorJ/bastion-image&utm_campaign=badger)
[![Build Status](https://travis-ci.org/OlegGorj/bastion-image.svg?branch=master)](https://travis-ci.org/OlegGorj/bastion-image)
[![Docker Pulls](https://img.shields.io/docker/pulls/OlegGorJ/bastion-image.svg)](https://hub.docker.com/r/OlegGorJ/bastion-image)
[![GitHub Issues](https://img.shields.io/github/issues/OlegGorJ/bastion-image.svg)](https://github.com/OlegGorJ/bastion-image/issues)
[![Average time to resolve an issue](http://isitmaintained.com/badge/resolution/OlegGorJ/bastion-image.svg)](http://isitmaintained.com/project/OlegGorJ/bastion-image "Average time to resolve an issue")
[![Percentage of issues still open](http://isitmaintained.com/badge/open/OlegGorJ/bastion-image.svg)](http://isitmaintained.com/project/OlegGorJ/bastion-image "Percentage of issues still open")

# Hardened Bastion with MFA on Docker

Project to build secured and hardened Bastion Docker image

---

## Usage

### Environment setup

Google Authenticator is a free & open source MFA solution - to enable it as MFA provider:

```
export MFA_PROVIDER=google-authenticator

```

### Quick start

Here's how you can quickly run the bastion. Assuming you have `~/.ssh/authorized_keys` properly configured and your SSH key (e.g. `~/.ssh/id_rsa`) added to your SSH agent.

```bash
$ docker run -it -p 1234:22 \
     -e MFA_PROVIDER=google-authenticator \
     -v ~/.ssh/authorized_keys:/root/.ssh/authorized_keys
     OlegGorJ/bastion-image:latest
```

In another terminal you should be able to run:

```bash
$ ssh root@localhost -p 1234
```

The first time you connect, you'll be asked to setup your MFA device, then, each next time you connect, you'll be prompted to enter your MFA token.


---
