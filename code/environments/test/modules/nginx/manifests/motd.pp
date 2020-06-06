class nginx::motd (
  String $module = 'Ngin:X',
  String $author = 'SysAdmin-Cloud_User',
  String $userx  = $::userx
){

  class { 'nginx::echome':
    module  => $module,
    author  => $author,
    userx   => $userx,
    # message => "This is a new message from overriden variables - $module and $author."
  }

  notice( "We have to check $userx for system abuse !" )
}
