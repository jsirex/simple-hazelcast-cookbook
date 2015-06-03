# Description

This cookbook installs Hazelcast in very basic manner.

# Usage

Modify `default['hazelcast']['download_url']` and `default['hazelcast'][checksum']` to change hazelcast version.
Jar name to use will be extracted from this url.

# Configuration

There is only one configuration way available: `node['hazelcast']['java_opts']`
Use it to configure both java and hazelcast.
Provide your own hazelcast.xml for this in your wrapper cookbook

# Requirements

## Platform:

* Debian

## Cookbooks:

* ark
* runit

# Attributes

* `node['hazelcast']['user']` -  Defaults to `hazelcast`.
* `node['hazelcast']['group']` -  Defaults to `hazelcast`.
* `node['hazelcast']['home']` -  Defaults to `/opt/hazelcast`.
* `node['hazelcast']['download_url']` -  Defaults to `https://oss.sonatype.org/content/repositories/releases/com/hazelcast/hazelcast-all/3.4.2/hazelcast-all-3.4.2.jar`.
* `node['hazelcast']['checksum']` -  Defaults to `d80efb8c56373bd175f8a45f300ba3a33d007be2413ccc62a848ade54af04a17`.
* `node['hazelcast']['java_home']` -  Defaults to `nil`.
* `node['hazelcast']['java_opts']` -  Defaults to `[ ... ]`.

# Recipes

* simple-hazelcast::configure
* simple-hazelcast::default
* simple-hazelcast::install
* simple-hazelcast::service_runit

# License and Maintainer

Maintainer:: Yauhen Artsiukhou (<yauhen_artsiukhou@epam.com>)

License:: apache 2
