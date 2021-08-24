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
  after => 'server_name _;',
  line => "\n\tadd_header X-Served-By \$hostname;\n",
}

service {'nginx':
  ensure  => running,
}
