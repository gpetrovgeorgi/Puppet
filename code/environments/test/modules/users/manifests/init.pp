class users (
  Hash $users2add,
){

  $users2add.each |String $name, Hash $user| {
    users::create { $name: 
      ensure    => $user['ensure'],
      uid       => $user['uid'],
      home      => $user['home'],
      team      => $user['team'],
      specialty => $user['specialty'],
    }
  }
}

