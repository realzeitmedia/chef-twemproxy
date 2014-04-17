tp_filename = "twemproxy-#{node[:twemproxy][:version]}"
target_extractpath = "#{Chef::Config[:file_cache_path]}/#{tp_filename}"
target_filepath = "#{target_extractpath}.tar.gz"

if not node[:twemproxy][:version]
  raise "You need to specify a version (got: '#{node[:twemproxy][:version]}') if you are not using 'git' as download method (got method: '#{node[:twemproxy][:download_method]}'"
end

remote_file target_filepath do
  source node[:twemproxy][:dist_url]
  notifies :run, "bash[extract_twemproxy]", :immediately
  not_if { ::File.exists?(target_filepath) }
end

bash "extract_twemproxy" do
  not_if { ::File.exists?(target_extractpath) }
  user "root"
  cwd ::File.dirname(target_filepath)
  code <<-EOH
  mkdir #{target_extractpath}
  tar xzf #{target_filepath} -C #{target_extractpath}
  mv #{target_extractpath}/*/* #{target_extractpath}/
  EOH
  action :nothing
  notifies :run, "bash[install_twemproxy]", :immediately
end

bash "install_twemproxy" do
  # Runs the installation when the version does not match or no version
  # is given.
  not_if "/usr/local/sbin/nutcracker --version 2>&1 | grep -q '#{node[:twemproxy][:version]}'"
  user "root"
  cwd target_extractpath
  code <<-EOH
  ./configure #{node[:twemproxy][:configure_options]} && make && make install
  EOH
  action :nothing
end
