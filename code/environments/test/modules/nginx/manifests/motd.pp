class nginx::motd (
  String $module = 'Ngin:X',
  String $author = 'SysAdmin-Cloud_User',
){

  class { 'nginx::echome':
    module  => $module,
    author  => $author,
   # message => "This is a new message from overriden variables - $module and $author."
  }
}
