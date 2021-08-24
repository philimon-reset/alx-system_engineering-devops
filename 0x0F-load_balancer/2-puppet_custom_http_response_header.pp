#!/usr/bin/env bash
# setup nginx


exec {'update':
  command => '/usr/bin/apt-get update',
}

package {'nginx':
  ensure  => installed,
}

file {'/var/www/html/index.nginx-debian.html':
  content => 'Holberton School for the win!',
}

file_line {'configure redirection':
  path => '/etc/nginx/sites-available/default',
  after => 'server_name _;',
  line => "\n\tlocation /redirect_me {\n\t\treturn 301 https://youtu.be/dQw4w9WgXcQ;\n\t}\n",
}

file_line {'add header':
  path => '/etc/nginx/sites-available/default',
  after => 'root /var/www/html;',
  line => "\tadd_header X-Served-By \$HOSTNAME;",
}

exec {'restart':
  command => '/usr/sbin/service nginx start',
}

service {'nginx':
  ensure  => running,
}
