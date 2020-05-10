each( $facts['disks'] ) |$blah| {
  notice( "The disks info is:\nThe disk name is: ${blah[0]}\nThe disk model is: ${blah[1]['model']}\nThe disk size is: ${blah[1]['size']}" )
}

notice( "${facts['disks']}" )
