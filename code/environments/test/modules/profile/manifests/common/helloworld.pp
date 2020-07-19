# Usage: profile::common::helloworld

class profile::common::helloworld {

  notify { 'greeting':
    message => 'Hello, world!'
  }
}
