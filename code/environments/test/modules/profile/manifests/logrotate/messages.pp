# Usage: include profile::logrotate::messages

class profile::logrotate::messages {

  logrotate::rule { 'var_log_messages':
    ensure        => present,
    rotate_every  => 'week',
    rotate        => '4',
    delaycompress => true,
    compress      => true,
    path          => '/var/log/messages',
    ifempty       => false,
  }
}
