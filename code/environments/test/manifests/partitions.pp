each( $facts['partitions'] ) |$disk| {
  notice( "This host has disk with name: ${disk[0]} and size: ${disk[1]['size']}" )
}
