version = node[:twemproxy][:version].empty? ? "master" : node[:twemproxy][:version]
tp_filename = "twemproxy-#{version}"
target_extractpath = "#{Chef::Config[:file_cache_path]}/#{tp_filename}"

git target_extractpath do
  repository node[:twemproxy][:repo_url]
  reference version
  action :sync
  notifies :run, "bash[install_twemproxy]", :immediately
end

bash "install_twemproxy" do
  # The version in git don't match the version in the nutcracker output.
  # So we always install if a new repository has been cloned.
  user "root"
  cwd target_extractpath
  code <<-EOH
  autoreconf -fvi
  CFLAGS="-O1" ./configure #{node[:twemproxy][:configure_options]} && make && make install
  EOH
  action :nothing
end
