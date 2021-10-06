# stupid rename

package {'nginx':
  ensure  => installed,
}

file { '/etc/default/nginx':
    ensure  => file,
    content => 'ULIMIT="-n 15000"',
}

exec { 'restart':
    command => 'service nginx restart',
    path    =>  [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ]
}
