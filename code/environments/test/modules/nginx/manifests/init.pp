class nginx (
  String  $version, 
  Enum['running', 'stopped'] $status, 
  Boolean $enabled, 
){
  notice ( "Install the $version of NginX, ensure it's $status, and set boot time start $enabled." )

  package { 'nginx':
    ensure => $version,
    notify => Service['nginx'],
  }

  service { 'nginx':
    ensure    => $status,
    enable    => $enabled,
    subscribe => Package['nginx'],
  }
}

