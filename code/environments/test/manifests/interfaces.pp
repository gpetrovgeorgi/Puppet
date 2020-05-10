#each( $facts['networking']['interfaces'] ) |$name| {
#  notice( "This is interface: << ${name[0]} >> with ipv4: ${name[1]['ip']} and ipv6: ${name[1]['ip6']}" )
#}
 
split( $facts['interfaces'], ',').each |$index,$interface| {
  notice("On interface ${interface} with index #${index} is assigned ip -> ${facts["ipaddress_${interface}"]}") 
}
