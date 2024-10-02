services:
  #
  # nginx services
  #
  {%- for i in range(instance_num) %}
  {%- set index = loop.index - 1 %}
  {%- set nginx_port = nginx_port + index %}
  nginx{{index}}:
    image: nginx:1.27.1@sha256:287ff321f9e3cde74b600cc26197424404157a72043226cbbf07ee8304a2c720
    ports:
      - "{{nginx_port}}:80"
    volumes:
      - ./dist/{{index}}/files/nginx/etc/nginx/nginx.conf:/etc/nginx/nginx.conf:ro
      - ./dist/{{index}}/files/nginx/etc/nginx/conf.d/:/etc/nginx/conf.d/:ro
    command: [nginx-debug, '-g', 'daemon off;']
  {%- endfor %}
  #
  # api services
  #
  {%- for i in range(instance_num) %}
  {%- set index = loop.index - 1 %}
  {%- set api_port = api_port + index %}
  api{{index}}:
    image: docker-nginx-sandbox-api:{{index}}
    ports:
      - "{{api_port}}:80"
    volumes:
      - ./dist/{{index}}/files/api/main.py:/app/src/main.py:ro
  {%- endfor %}
  httpbin:
    image: kennethreitz/httpbin
    ports:
      - "8030:80"
