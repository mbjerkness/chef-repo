# See http://docs.opscode.com/config_rb_knife.html for more information on knife configuration options
cookbook_copyright		"BjerkNet"
cookbook_license		"apachev2"
cookbook_email			"mike@bjerkness.com"

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "mikebjerkness"
client_key               "#{current_dir}/mikebjerkness.pem"
validation_client_name   "bjerknet-validator"
validation_key           "#{current_dir}/bjerknet-validator.pem"
chef_server_url          "https://api.opscode.com/organizations/bjerknet"
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["#{current_dir}/../cookbooks"]