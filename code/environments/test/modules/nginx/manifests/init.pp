class nginx (
  $version = 'latest',
  $status  = 'stopped',
  $enabled = true,
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
  
  file { '/etc/nginx/nginx.hello':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/nginx/nginx.hello',
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
