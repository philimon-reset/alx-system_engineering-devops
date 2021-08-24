# setup nginx

package {'nginx':
  ensure  => installed,
}

file_line {'add header':
  path => '/etc/nginx/sites-available/default',
  after => 'root /var/www/html;',
  line => 'add_header X-Served-By $hostname;',
}

service {'nginx':
  ensure  => running,
  enable => True,
}
