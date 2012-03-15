base_dir = File.dirname(__FILE__)
node = Yajl::Parser.new.parse(File.new("/etc/chef-custom/dna.json", "r"))

cookbooks_path = "#{base_dir}/cookbooks"

file_store_path   base_dir
file_cache_path   base_dir
cookbook_path     cookbooks_path
role_path         "#{base_dir}/roles"
node_name         node["engineyard"]["this"]

require "fileutils"
$LOAD_PATH.each do |path|
  recipe_path = path.gsub(%r{/lib$},'')
  if metadata_path = File.exist?(File.join(recipe_path, 'metadata.json'))
    p metadata_path
    metadata = Yajl::Parser.new.parse(File.new(metadata_path, "r"))
    p metadata
    puts "Unpacking #{metadata["name"]} recipe into cookbooks from #{cookbooks_path}"
    FileUtils.cp_r(recipe_path, File.join(cookbooks_path, metadata["name"]))
  end
end
