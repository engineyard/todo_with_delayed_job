# Runs application cookbooks

custom_json = json.dup
custom_json['run_list'] = 'recipe[main]'
File.open(custom_dna, 'w') do |f|
  f.puts JSON.pretty_generate(custom_json)
  f.chmod(0600)
end


run "cd #{latest_release}; sudo bundle exec chef-solo -c #{latest_release}/deploy/solo.rb -j /etc/chef-custom/dna.json"
