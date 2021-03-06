# /etc/puppet/manifests/site.pp

import "modules"
import "nodes"

filebucket { main: server => "puppettest.internal.londonit.org" }

# global defaults
File { backup => main }
Exec { path => "/usr/bin:/usr/sbin/:/bin:/sbin" }

Package {
	provider => $operatingsystem ? {
		redhat => yum,
		centos => yum,
		fedora => yum
	}
}
