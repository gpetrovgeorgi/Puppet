$service_status = 'stopped'
$want_utils = 'yes'

$utils = {
  'htop' => {
    present => $want_utils,
    tag     => 'htop',  
  }, 
  'whois' => {
    present => $want_utils,
    tag     => 'whois',
  },
  'git' => {
    present => $want_utils,
    tag     => 'git',
  },
}

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

$utils.each |$name,$specs| {
  $present = $specs['present'] ? {
    'yes'     => 'present',
    'no'      => 'absent',
    default   => 'unknown',    
  }
  package { $name:
    ensure => $present,
    tag    => $specs['tag'],
  }
}
notify { 'hey':
  message => 'Those could be restarted !',
}

Package <| tag == 'service' |> ~> Notify['hey']
