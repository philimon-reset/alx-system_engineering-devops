# puppet allow user and expand file descriptor limit

file_line {'configure redirection':
  path  => '/etc/security/limits.conf',
  after => '# /etc/security/limits.conf',
  line  => "session required pam_limits.so\nholberton hard nofile 5000\nholberton soft nofile 4000",
}
