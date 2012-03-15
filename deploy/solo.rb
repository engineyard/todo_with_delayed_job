base_dir = File.dirname(__FILE__)
node = Yajl::Parser.new.parse(File.new("/etc/chef/dna.json", "r"))

file_store_path   base_dir
file_cache_path   base_dir
cookbook_path     "#{base_dir}/cookbooks"
role_path         "#{base_dir}/roles"
node_name         node["engineyard"]["this"]
