reverse_each( $facts['system_uptime'] ) |$uptime| {
  notice( "This is the sys uptime: ${uptime[1]} ${uptime[0]}" )
}
