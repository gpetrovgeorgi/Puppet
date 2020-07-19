$service_status = 'stopped'

package { 'httpd':
  ensure => present,
  tag    => ['httpd','service'],
  notify => Service['httpd'],
}

service { 'httpd':
  ensure  => $service_status,
  enable  => false,
  require => Package['httpd'],
}

package { 'docker':
  ensure => present,
  tag    => ['docker','service'],
  notify => Service['docker'],
}

service { 'docker':
  ensure => $service_status,
  enable => false,
  require => Package['docker'],
}

notify { 'hey':
  message => 'Those could be restarted !',
}

Package <| tag == 'service' |> ~> Notify['hey']
