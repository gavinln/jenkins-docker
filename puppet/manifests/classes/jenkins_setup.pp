# setup jenkins
class jenkins_setup {
    include jenkins
    jenkins::plugin { "git-client" :
    }
    jenkins::plugin { "parameterized-trigger" :
    }
    jenkins::plugin { "git":
    }
    jenkins::plugin { "docker-plugin":
    }
}
