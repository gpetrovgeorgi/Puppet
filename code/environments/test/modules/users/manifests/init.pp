class users (
  Hash $users2add,
){

  $users2add.each |String $name, Hash $user| {
    user { $name: 
      ensure => $user['ensure'],
      uid    => $user['uid'],
      home   => $user['home'],
    }
  }
}

