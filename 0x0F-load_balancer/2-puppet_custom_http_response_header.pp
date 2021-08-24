# setup nginx

exec {'update':
	command => '/usr/bin/apt-get update',
}
package { 'nginx':
	ensure  => installed,
}
file_line { 'add HTTP header':
	ensure => 'present',
	path   => '/etc/nginx/sites-available/default',
	after  => 'listen 80 default_server;',
	line   => 'add_header X-Served-By $hostname;',
}

service { 'nginx':
	ensure  => 'running',
}