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
  line => '\n\tadd_header X-Served-By $hostname;\n',
}

exec {'restart':
  command => '/usr/sbin/service nginx start',
}

service {'nginx':
  ensure  => running,
}
