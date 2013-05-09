maintainer       "PromoJam, Inc."
maintainer_email "ticean@promojam.com"
license          "Apache 2.0"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.3.4"

description      "Install a Storm topology"

depends          "install_from"
depends          "runit"
depends          "silverware"
depends          "thrift"
depends          "volumes"

recipe           "storm::install_from_git",        "Install Storm from git repository"
recipe           "storm::install_from_release",    "Install Storm from release"

%w[ ubuntu ].each do |os|
  supports os
end

