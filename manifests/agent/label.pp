# @summary Add agent label
#
# @example
#   sensu::agent::label { 'contacts': value => 'ops@example.com' }
#
# @param key
#   Key of the label to add to agent.yml, defaults to `$name`.
# @param value
#   Label value to add to agent.yml
# @param order
#   Order of the datacat fragment
#
define sensu::agent::label (
  String[1] $value,
  String[1] $key   = $name,
  String[1] $order = '50',
) {
  datacat_fragment { "sensu_agent_config-label-${name}":
    target => 'sensu_agent_config',
    data   => {
      'labels' => { $key => $value },
    },
    order  => $order,
  }
}
