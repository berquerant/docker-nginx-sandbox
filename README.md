# docker-nginx-sandbox

Sandbox for nginx.

# Usage

## Prepare environment

``` shell
pipenv install
pipenv shell
```

## Run nginx and FastAPI application containers

Launch 3 nginx and 3 apps:

``` shell
bin/run.sh 3
```

`docker-compose.yml` is generated, within which nginx0, nginx1, nginx2, api0, api1, api2, httpbin are defined.

Application settings are located in `dist/NUMBER/files/api/`, main.py will be hot-reloaded.

nginx settings are locaied in `dist/NUMBER/nginx/etc/nginx/`.
Run `bin/restart_nginx.sh` to restart nginx containers.

Here are some examples of curl:

```
# nginx0
curl localhost:18000/
# api1
curl localhost:19001/
# api1 via nginx0
curl localhost:18000/api1/
# api2 via nginx1 via nginx0
curl localhost:18000/nginx1/api2/
```

## Regenerate settings files

Do not overwrite existing setting files:

``` shell
bin/run.sh INSTANCE_NUM
```

Overwrite:

``` shell
CLEAN=1 bin/run.sh INSTANCE_NUM
```

Change ports:

``` shell
NGINX_PORT=xxx API_PORT=yyy bin/run.sh INSTANCE_NUM
```
