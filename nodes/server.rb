{
  "name": "server",
  "chef_environment": "_default",
  "normal": {
    "tags": [

    ]
  },
  "run_list": [
    "recipe[my_cookbook]",
    "role['web_server]"
  ]
}
