# Usage: include role::common:common_config

class role::common::common_config {
  include profile::common::default_users
  include profile::common::default_utils
}
