#!/usr/bin/env bash
# setup nginx

package {'nginx':
  ensure  => installed,
}

file {'/var/www/html/index.nginx-debian.html':
  content => 'Holberton School for the win!',
}

file_line {'configure redirection':
  path => '/etc/nginx/sites-available/default',
  after => 'root /var/www/html;',
  line => "\n\tlocation /redirect_me {\n\t\treturn 301 https://youtu.be/dQw4w9WgXcQ;\n\t}\n",
}

service {'nginx':
  ensure  => running,
}
