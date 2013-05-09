
# Directories, hosts and ports     # =
default[:storm][:home_dir]           = '/usr/local/share/storm'
default[:storm][:data_dir]           = '/mnt/storm'
default[:storm][:log_dir]            = '/var/log/storm'

# Users and groups
default[:storm][:user]               = 'storm'
default[:storm][:group]              = 'nogroup'
default[:users]['storm'][:uid]       = 440
default[:users]['storm'][:gid]       = 440

# Service states
default[:storm][:nimbus    ][:run_state]             = :start
default[:storm][:nimbus    ][:dashboard][:run_state] = :start
default[:storm][:supervisor][:run_state]             = :start

# Nimbus attributes
default[:storm][:nimbus][:dashboard_port]   = 8080

# Supervisor attributes
default[:storm][:supervisor][:env]   = Hash.new
default[:storm][:supervisor][:ports] = [6700, 6701, 6702, 6703]

#
# Install
#

# install_from_release
default[:storm][:version]            = "0.8.0"
default[:storm][:release_url]        = "https://github.com/downloads/nathanmarz/storm/storm-:version:.zip"

# Git install
default[:storm][:git_repo]           = 'git://github.com/nathanmarz/storm.git'
default[:storm][:git_revision]       = '0.8.0' # 'HEAD'

