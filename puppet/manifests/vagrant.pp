#
# puppet magic for dev boxes
#
import "classes/*.pp"

$PROJ_DIR = "/vagrant"
$HOME_DIR = "/home/vagrant"

Exec {
    path => "/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/bin",
}

class dev {
    class {
        init:;
        docker_setup:;
        jenkins_setup: require => Class[init];
        ohmyzsh_setup: require => Class[init];
    }
}

include dev

