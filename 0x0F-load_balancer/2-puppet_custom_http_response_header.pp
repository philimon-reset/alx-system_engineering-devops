#!/usr/bin/env bash
# setup nginx

package {'nginx':
  ensure  => installed,
}

file_line {'add header':
  path => '/etc/nginx/sites-available/default',
  after => 'server_name _;',
  line => "\n\tadd_header X-Served-By \$HOSTNAME;\n",
}

service {'nginx':
  ensure  => running,
  enable => True,
}
