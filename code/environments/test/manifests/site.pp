notify { 'UsingTest':
  message => 'We are using TesT environment catalog !',
}

lookup('classes', Array[String], 'unique').include
