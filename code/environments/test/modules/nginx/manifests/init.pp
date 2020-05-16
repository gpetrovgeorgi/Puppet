class nginx (
  String  $version, 
  String  $status, 
  Boolean $enabled, 
  String  $proxy_redirect,
  String  $client_max_body_size,
  String  $proxy_connect_timeout,
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
  
  file { '/etc/nginx/conf.d/proxy.conf':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('nginx/proxy.conf.erb'), 
  }

  file { '/tmp/nginx':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0444',
  }
}

lookup('classes', Array[String], 'unique').include
