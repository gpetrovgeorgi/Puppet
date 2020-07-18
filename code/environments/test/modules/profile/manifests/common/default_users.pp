# Usage: include profile::common_users::users

class profile::common::default_users (
  String $create_users = 'true' ){

  $users = {
    'jack' => {
      uid     => '10101',
      home    => '/home/jack',
      pwd     => 'BlahHh',
      present => $create_users, 
    },
    'jill' => {
      uid     => '10999',
      home    => '/home/jill',
      pwd     => 'Nyah',
      present => $create_users, 
    },
  }
  
  $users.each |$user,$config| {
    $present = $config['present'] ? {
      'true'    => 'present',
      'false'   => 'absent',
      default   => 'unknown',
    }
  
    user { $user:
      ensure   => $present,
      uid      => $config['uid'],
      home     => $config['home'],
      password => $config['pwd'],
    }
  }
}
