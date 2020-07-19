# Usage: include profile::common::system_info

class profile::common::system_info {

  each( $facts['disks'] ) |$disk| {
    notice( "System Disk/s:\nDisk name: ${disk[0]}\nDisk model: ${disk[1]['model']}\nDisk size: ${disk[1]['size']}" )
  }
  
  notice('<=====================>')
  
  each($facts['memory']) |$mem| {
    notice("System Memory:\nType: ${mem[0]}\nAvailable memory: ${mem[1]['available']}\nTotal memory: ${mem[1]['total']}\nUsed memory: ${mem[1]['used']}")
  }
  
  notice('<=====================>')
  split( $facts['interfaces'], ',').each |$index,$interface| {
    notice("System Interface #${index}:\nOn interface << ${interface} >> is assigned ip -> ${facts["ipaddress_${interface}"]}")
  }
  
  notice('<=====================>')
  $uptimes = $facts['system_uptime']
  notice("System Uptime Info:\nUptime in days: ${uptimes['days']}\nUptime in hours: ${uptimes['hours']}\nTotal system uptime: ${uptimes['uptime']}")
  
  # Old way with reverse iteration
  #reverse_each( $facts['system_uptime'] ) |$uptime| {
  #  notice( "This is the sys uptime: ${uptime[1]} ${uptime[0]}" )
  #}
}
