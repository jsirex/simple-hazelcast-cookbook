This cookbook installs Hazelcast in very basic manner.

# Usage

Modify `default['hazelcast']['download_url']` and `default['hazelcast'][checksum']` to change hazelcast version.
Jar name to use will be extracted from this url.

# Configuration

There is only one configuration way available: `node['hazelcast']['java_opts']`
Use it to configure both java and hazelcast.
Provide your own hazelcast.xml for this in your wrapper cookbook
