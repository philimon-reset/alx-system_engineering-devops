#!/usr/bin/env bash
# setup nginx

exec {'update':
  command => '/usr/bin/apt-get update',
}

package {'nginx':
  ensure  => installed,
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
