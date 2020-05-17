class nginx::files_dirs (
  String  $proxy_redirect,
  String  $client_max_body_size,
  String  $proxy_connect_timeout,
){

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
