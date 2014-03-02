name "dev"
description "Development environment"
run_list "recipe[my_cookbook]"
default_attributes "my_cookbook" => {"message" => "Hello Development Environment"}
#override_attributes "ntp" => {"servers" => ["0.europe.pool.ntp.org","1.europe.pool.ntp.org","2.europe.pool.ntp.org"]}