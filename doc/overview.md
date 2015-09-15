This cookbook installs Hazelcast in very basic manner.

# Usage

Modify `default['hazelcast']['download_url']` and `default['hazelcast'][checksum']` to change hazelcast version.
Jar name to use will be extracted from this url.

# Configuration

## Class path

There is hash `node['hazelcast']['class_path']`. Add your custom class pathes here.
Key is for name, value is actual path for class path. Hazelcast jar will be automatically added here.


## Java opts

There is hash `node['hazelcast']['java_opts']`. Add your custom java options here.
Use it to configure both java and hazelcast.
Key is for name, value is actual java option string passed as argument to command line.

Provide your own hazelcast.xml for this in your wrapper cookbook.
