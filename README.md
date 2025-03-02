# miniPaint Dockerized

[![Build Status](https://github.com/patrickfav/docker-minipaint/actions/workflows/docker_build_and_push.yml/badge.svg)](https://github.com/patrickfav/docker-minipaint/actions)
[![Docker Image Version (latest by date)](https://img.shields.io/docker/v/pfav/minipaint?label=docker.io)](https://hub.docker.com/r/pfav/minipaint)

This is a dockerized version of the [miniPaint](https://github.com/viliusle/miniPaint) project by [viliusle](https://github.com/viliusle). To optimize for space and security this project only serves from [Alpine](https://www.alpinelinux.org/) with [nginx](https://www.nginx.com/) webserver.

## Quickstart

Use it as follows to run it locally on port 8080:

```bash
docker run -p 8080:80  pfav/minipaint:latest   
```

## Build

This image uses multi-stage docker to build and serve the application. It uses a node container to build and a simple nginx one to serve your files (i.e. no application server is in place while running):

```bash
docker build -t local/minipaint .
docker run -p 8080:80  local/minipaint
```

Per default, it uses port `80` and the version is fixed to a tag that can be found in the Dockerfile.

### Prepare GitHub-Actions

Add the following parameters to [GitHub Actions secrets](https://docs.github.com/en/actions/security-guides/encrypted-secrets):

```bash
DOCKERHUB_TOKEN // -> https://docs.docker.com/docker-hub/access-tokens/
```

## Deploy

By default, every commit will build and deploy `latest` tag. If you want to build and deploy a specific version, tag the
commit with the very same tag as is [used here](https://github.com/viliusle/miniPaint/releases). CI will deploy to 
[docker.io](https://hub.docker.com/r/pfav/minipaint) and [ghcr.io](https://github.com/patrickfav/docker-minipaint/pkgs/container/minipaint).

# Credits

* [viliusle](https://github.com/viliusle) for providing miniPaint ([MIT License](https://github.com/viliusle/miniPaint/blob/master/MIT-LICENSE.txt))

# License

Copyright 2022 Patrick Favre-Bulle

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

```
http://www.apache.org/licenses/LICENSE-2.0
```

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
