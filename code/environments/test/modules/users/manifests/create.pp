define users::create (
  Integer $uid,
  String $home,
  String $ensure,
){

  user { $title:
    ensure => $ensure,
    uid    => $uid,
    home   => $home,
  }
}
