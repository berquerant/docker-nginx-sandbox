server {
    listen       80;
    server_name  localhost;

    location / {
        root   /usr/share/nginx/html;
        index  index.html index.htm;
    }

    error_page   500 502 503 504  /50x.html;
    location = /50x.html {
        root   /usr/share/nginx/html;
    }

    #
    # forward to FastAPI application
    #
    {%- for i in range(instance_num) %}
    location /api{{i}}/ {
        proxy_pass http://api{{i}}:80/;
    }
    {%- endfor %}
    #
    # forward to nginx
    #
    {%- for i in range(instance_num) %}
    location /nginx{{i}}/ {
        proxy_pass http://nginx{{i}}:80/;
    }
    {%- endfor %}

    # forward to httpbin
    location /bin/ {
        proxy_pass http://httpbin:80/;
    }
}
