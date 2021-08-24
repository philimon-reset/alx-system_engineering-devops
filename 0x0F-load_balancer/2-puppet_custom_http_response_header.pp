#!/usr/bin/env bash
# setup nginx

package {'nginx':
  ensure  => installed,
}

file_line {'add header':
  path => '/etc/nginx/sites-available/default',
  after => 'root /var/www/html;',
  line => "\n\tadd_header X-Served-By \$HOSTNAME;\n",
}

service {'nginx':
  ensure  => running,
  enable => True,
  require => Package['nginx'],
}
