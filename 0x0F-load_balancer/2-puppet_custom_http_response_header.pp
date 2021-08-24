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
	after  => 'server_name _;',
	line   => "\tadd_header X-Served-By \$hostname;\n",
}

exec {'restart':
	command => '/usr/sbin/service nginx restart',
}

service { 'nginx':
	ensure  => 'running',
}
