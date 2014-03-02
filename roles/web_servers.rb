name "web_servers"
description "This role contains nodes, which act as web servers"
run_list "recipe[ntp]", "recipe[my_cookbook]"
default_attributes(
	'ntp' => {
		'ntpupdate' => {
			'disable' => true
		}
	},
	'my_cookbook' => {
		'message' => 'Web Server Role is overriding!'
	}
)