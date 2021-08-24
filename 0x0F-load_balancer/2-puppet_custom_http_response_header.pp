# Manifest that install Nginx and configures:
#   a simple default page.
#   a custom header with the server hostname.

package { 'nginx':
  ensure  => installed,
}

file { '/var/www/html/index.html':
  content => 'Holberton School',
}

file_line { 'writes redirection site':
  ensure => 'present',
  path   => '/etc/nginx/sites-available/default',
  after  => 'listen 80 default_server;',
  line   => 'rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;',
}

file_line { 'add HTTP header':
  ensure => 'present',
  path   => '/etc/nginx/sites-available/default',
  after  => 'listen 80 default_server;',
  line   => 'add_header X-Served-By $hostname;',
}

service { 'nginx':
  ensure  => 'running',
  enable  => true,
  require => Package['nginx'],
}
