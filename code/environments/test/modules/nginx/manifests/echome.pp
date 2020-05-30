class nginx::echome (
  String $module  = 'nginx',
  String $author  = 'cloud_user',
  String $message = "You are using module $module, please be careful. Author: $author",
){

  notice( "$message" )

}
