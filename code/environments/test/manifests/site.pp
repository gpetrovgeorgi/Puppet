notify { 'UsingTest':
  message => 'We are using TesT environment catalog !',
}

$userx = 'DevOps_User_XYZ'

lookup('classes', Array[String], 'unique').include
