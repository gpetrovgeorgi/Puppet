# Usage: include profile::common::default_utils

class profile::common::default_utils (
  String $want_utils ){

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
    'lsof' => {
      present => $want_utils,
      tag     => 'lsof',
    },
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
}
