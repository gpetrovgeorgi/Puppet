$status = lookup({ name => 'puppet::status', default_value => 'running' })
$enabled = lookup({ name => 'puppet::enabled', default_value => true })

service { 'puppet':
  ensure => $status,
  enable => $enabled,
}
