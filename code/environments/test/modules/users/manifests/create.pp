define users::create (
  Integer $uid,
  String $home,
  String $ensure,
  String $team,
  String $specialty,
){

  user { $title:
    ensure => $ensure,
    uid    => $uid,
    home   => $home,
  }
  if ( $ensure == 'present'){
    notice("Hello, my name is $title and I am from $team team. My specialty is --> $specialty.")
  }
}
