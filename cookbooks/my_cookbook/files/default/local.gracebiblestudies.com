server {
       client_max_body_size 20M;
        listen 80;
       server_name local.gracebiblestudies.com;
       root /var/www; #You can also use /home/ubuntu/your_domain
        
        #on server block
        ##necessary if using a multi-site plugin
        server_name_in_redirect off;

        ##necessary if running Nginx behind a reverse-proxy
        port_in_redirect off;

        rewrite ^.*/files/(.*)$ /wp-includes/ms-files.php?file=$1 last;
        if (!-e $request_filename) {
                rewrite ^.+?(/wp-.*) $1 last;
                rewrite ^.+?(/.*\.php)$ $1 last;
                rewrite ^ /index.php last;
        }

        access_log /var/log/nginx/bastos-access.log;

       index index.php index.html;
       location = /favicon.ico {
                log_not_found off;
                access_log off;
       }
       location = /robots.txt {
                allow all;
                log_not_found off;
                access_log off;
       }
       # Deny all attempts to access hidden files such as .htaccess, .htpasswd, .DS_Store (Mac).
       location ~ /\. {
                deny all;
                access_log off;
                log_not_found off;
       }
       location / {
                try_files $uri $uri/ /index.php?$args;
       }
       # Add trailing slash to */wp-admin requests.
       rewrite /wp-admin$ $scheme://$host$uri/ permanent;
       location ~*  \.(jpg|jpeg|png|gif|css|js|ico)$ {
                expires max;
                log_not_found off;
       }
       location ~ \.php$ {
                try_files $uri =404;
                include /etc/nginx/fastcgi_params;
                fastcgi_pass 127.0.0.1:9000;
                fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
       }
}