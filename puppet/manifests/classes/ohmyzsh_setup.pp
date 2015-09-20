# Install zsh and ohmyzsh
class ohmyzsh_setup {
    case $operatingsystem {
        ubuntu: {
            class { 'ohmyzsh':
                require => Exec['update_apt']
            }
            #file_line { 'zsh_locale':
            #    line => 'export LC_ALL=en_US.UTF-8',
            #    path => '/home/vagrant/.zshrc',
            #    require => Class['ohmyzsh']
            #}
            # The following two do not work if git port is blocked
            #ohmyzsh::install { 'vagrant':
            #    require => Class['ohmyzsh'],
            #    before => Exec['vagrant_bash']
            #}
            #ohmyzsh::plugins { 'vagrant':
            #    require => Class['ohmyzsh'],
            #    plugins => 'tmux'
            #}
            # exec { "vagrant_bash":
            #     command => "chsh -s /bin/zsh vagrant"
            # }
        }
    }
}

