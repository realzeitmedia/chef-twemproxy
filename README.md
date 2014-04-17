# twemproxy cookbook

# Requirements

* `build-essential` - installs required tools to build a program from
  source
* `runit` - used as default (and currently only supported) init system

# Usage

# Attributes

* `node[:twemproxy][:version]` - the version to be installed like
  '0.4.0'. May be empty if the `install_method` is set to 'git'. This will check out the HEAD revision.
* `node[:twemproxy][:repo_url]` - the repo URL of the twemproxy
  sources used for a git checkout
* `node[:twemproxy][:dist_url]` - the location of the distribution
  tarballs. Used if install_method is set to `download`
* `node[:twemproxy][:install_method]` - either 'git' (which will
  clone the git repo) or 'download' which will download the distribution
  tarball
* `node[:twemproxy][:configure_options]` - provide additional flags
  to the 'configure' command. Like '--prefix' for a different
  installation path prefix
* `node[:twemproxy][:configfile]` - full path this cookbook will use to
  write the configuration file
* `node[:twemproxy][:config]` - the contents of this hash will be used
  to generate the config file (as YAML)
* `node[:twemproxy][:cmdline_options]` - provide additional command line
  options to twemproxy

# Recipes

* `default` - This installs all requirements, installs twemproxy and
  writes the configuration
* `config` - This only writes the configuration file and does not
  install twemproxy. Used as a helper cookbook in the `default`
cookbook.
* `git` - This installs git on your system using the standard distro
* `install` - Installs twemproxy based on the given `install_method`.
* `install_download` - Installs twemproxy from a distribution tarball.
  This is used as a helper cookbook from `install`.
* `install_download` - Installs twemproxy by cloning a git repository.
  This is used as a helper cookbook from `install`.

# Author and License

Author:: Christian Graf

```text
Copyright 2014, realzeit GmbH (http://realzeitmedia.com)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
