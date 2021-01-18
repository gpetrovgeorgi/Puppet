# Usage: include profile::mount::mount_raids

class profile::mount::mount_raids {

  mount { '/dev/md0':
    name   => '/raid1',
    ensure => mounted,
    atboot => true,
    device => '86fc3237-62b0-43f8-bfa6-31cdbe6534ff',
    fstype => 'ext4',
  }

  mount { '/dev/md5':
    name   => '/raid5',
    ensure => mounted,
    atboot => true,
    device => '718053fa-c1d2-4631-a83d-8eb970d3cbc8',
    fstype => 'ext4',
  }
}
