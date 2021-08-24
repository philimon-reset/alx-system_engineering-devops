# setup nginx

package {'nginx':
  ensure  => installed,
}

file { '/var/www/html/index.html':
  content => 'Holberton School',
}

file_line { 'configure redirect':
  ensure => 'present',
  path   => '/etc/nginx/sites-available/default',
  after  => 'listen 80 default_server;',
  line   => 'rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;',
}

file_line {'add header':
  path => '/etc/nginx/sites-available/default',
  after => 'root /var/www/html;',
  line => 'add_header X-Served-By $hostname;',
}

service {'nginx':
  ensure  => running,
  enable => True,
  require => Package['nginx'],
}
