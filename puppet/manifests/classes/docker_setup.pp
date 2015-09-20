# Docker setup
class docker_setup {
    class { 'docker':
        tcp_bind    => 'tcp://0.0.0.0:2375',
        socket_bind => 'unix:///var/run/docker.sock';
    }
    user {'vagrant':
        ensure => 'present'
    }
    exec {"vagrant_in_docker":
      unless => "grep -q 'docker\\S*vagrant' /etc/group",
      command => "usermod -aG docker vagrant",
      require => [User['vagrant'], Class['docker']]
    }
    docker::image { 'python:2.7.10':
        ensure => 'present',
        require => Class[docker]
    }
    docker::image { 'ruby:2.0.0':
        ensure => 'present',
        require => Class[docker]
    }
    docker::image { 'haskell:7.10.1':
        ensure => 'present',
        require => Class[docker]
    }
    docker::image { 'golang:1.3.3':
        ensure => 'present',
        require => Class[docker]
    }
    docker::image { 'java:7':
        ensure => 'present',
        require => Class[docker]
    }
    docker::image {'evarga/jenkins-slave':
        ensure => 'present',
        require => Class[docker]
    }
}
