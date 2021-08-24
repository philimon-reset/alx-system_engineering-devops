# setup nginx

exec {'/usr/bin/apt-get update':
}

package {'nginx':
  ensure  => installed,
}

file_line {'add header':
  path => '/etc/nginx/sites-available/default',
  after => 'server_name _;',
  line => "\n\tadd_header X-Served-By \$hostname;\n",
}

exec {'restart':
  command => '/usr/sbin/service nginx restart',
}

service {'nginx':
  ensure  => running,
}
