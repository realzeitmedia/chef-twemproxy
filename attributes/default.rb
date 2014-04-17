default[:twemproxy][:version] = ""
default[:twemproxy][:repo_url] = "https://github.com/twitter/twemproxy"
default[:twemproxy][:dist_url] = "https://twemproxy.googlecode.com/files/nutcracker-#{node[:twemproxy][:version]}.tar.gz"
default[:twemproxy][:install_method] = "git"
default[:twemproxy][:init_style] = "runit"

default[:twemproxy][:configure_options] = ""

default[:twemproxy][:log_dir] = "/var/log/twemproxy"
default[:twemproxy][:configfile] = "/etc/nutcracker.yml"
default[:twemproxy][:cmdline_options] = ""
default[:twemproxy][:config] = {}
