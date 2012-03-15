base_dir = File.dirname(__FILE__)
node = Yajl::Parser.new.parse(File.new("/etc/chef-custom/dna.json", "r"))

cookbook_paths = ["#{base_dir}/cookbooks"]
$LOAD_PATH.each do |path|
  base_path = path.gsub(%r{/lib$},'')
  if File.exist?(File.join(base_path, 'metadata.json'))
    cookbook_paths << File.dirname(base_path)
  end
end

file_store_path   base_dir
file_cache_path   base_dir
cookbook_path     cookbook_paths
role_path         "#{base_dir}/roles"
node_name         node["engineyard"]["this"]
