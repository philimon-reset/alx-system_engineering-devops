# stupid rename

file { '/etc/default/nginx':
    ensure  => file,
    content => 'ULIMIT="-n 15000"',
}

exec { 'restart':
    command => 'service nginx restart',
    path    =>  [ '/usr/sbin/service', '/sbin/' , '/usr/bin/', '/usr/sbin/' ]
}
