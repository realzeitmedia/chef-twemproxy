file node[:twemproxy][:configfile] do
  content YAML::dump(node[:twemproxy][:config].to_hash).split("\n")[1..-1].join("\n")
  mode 0644
  owner 'root'
  group 'root'
end
