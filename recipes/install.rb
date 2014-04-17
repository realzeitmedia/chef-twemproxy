include_recipe "build-essential"

package "libtool"
package "autotools-dev"
package "automake"

directory node[:twemproxy][:log_dir] do
  user   "root"
  group  "root"
  mode   00750
  action :create
end

include_recipe "twemproxy::install_#{node[:twemproxy][:install_method]}"

case node[:twemproxy][:init_style]
when "runit"
  include_recipe "runit::default"
  runit_service "twemproxy"

  service "twemproxy" do
    supports restart: true
  end
else
  raise "We are sorry, but init_style '#{node[:twemproxy][:init_style]}' is currently not supported. Please check the README for supported methods."
end
