# Mesos setup
class mesos_setup {
    class { 'mesos':
        ensure => present
    }
    #class{ 'mesos::master':
    #    master_port => 5050,
    #    work_dir => '/var/lib/mesos',
    #    require => Class['mesos'],
    #    options => {
    #        log_dir => '/var/log/mesos',
    #    }
    #}
    #class{ 'mesos::slave':
    #    require => Class['mesos::master'],
    #    master => '10.0.2.15'
    #}
}
