class nginx (
  $version               = 'latest',
  $status                = 'stopped',
  $enabled               = true,
  $proxy_redirect        = 'off',
  $client_max_body_size  = '10m',
  $proxy_connect_timeout = '90',
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

  file {'/tmp/nginx/':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0444',
    source => 'puppet:///modules/nginx/tmp_nginx',
  }
}

lookup('classes', Array[String], 'unique').include
