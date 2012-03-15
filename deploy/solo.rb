base_dir = File.dirname(__FILE__)
node = Yajl::Parser.new.parse(File.new("/etc/chef-custom/dna.json", "r"))

cookbooks_path = "#{base_dir}/cookbooks"

file_store_path   base_dir
file_cache_path   base_dir
cookbook_path     cookbooks_path
role_path         "#{base_dir}/roles"
node_name         node["engineyard"]["this"]

node["run_list"] = (node["run_list"].is_a?(Array) ? node["run_list"] : [node["run_list"]])

require "fileutils"
$LOAD_PATH.each do |path|
  recipe_path = path.gsub(%r{/lib$},'')
  if File.exist?(metadata_path = File.join(recipe_path, 'metadata.json'))
    metadata = Yajl::Parser.new.parse(File.new(metadata_path, "r"))
    unless name = metadata["name"]
      puts "ERROR: Recipe has no 'name' in metadata.json (#{cookbooks_path})"
    else
      puts "Unpacking #{metadata["name"]} recipe into cookbooks from #{cookbooks_path}"
      FileUtils.cp_r(recipe_path, File.join(cookbooks_path, name))

      node["run_list"] << "recipe[#{name}]"
    end
  end
end

