# jenkins-docker

* Source code - [Gitlab][1]
* Author - Gavin Noronha - <gnoronha@financialengines.com>

[1]: http://gitlab.fngn.com/gnoronha/jenkins-docker.git

## About

This project provides a [Ubuntu (14.04)][2] [Vagrant][3] Virtual Machine (VM)
that installs [Jenkins][4] and [Jenkins plugins][5] that runs [Docker][6]
images as [Jenkins slaves][7]

[2]: http://releases.ubuntu.com/14.04/
[3]: http://www.vagrantup.com/
[4]: https://jenkins-ci.org/
[5]: https://wiki.jenkins-ci.org/display/JENKINS/Docker+Plugin
[6]: https://www.docker.com/
[7]: https://hub.docker.com/r/evarga/jenkins-slave

There are [Puppet][8] scripts that automatically install the software when
the VM is started.

[8]: http://puppetlabs.com/

## Start the VM

1. Change to the jenkins-docker root directory

    ```
    cd jenkins-docker
    ```

2. Start the virtual machine (VM)

    ```
    vagrant up
    ```

3. Login to the VM

    ```
    vagrant ssh
    ```

4. Verify that Docker is installed

    ```
    docker info
    ```

5. List the Docker images downloaded and check for `evarga/jenkins-slave`

    ```
    docker images
    ```

## Shutdown the vm

1. Type `exit` to quit the virtual machine

2. To halt the VM type (fast to startup after a halt command)

    ```
    vagrant halt
    ```

3. To destroy the VM (slow to create VM after a destroy command)

    ```
    vagrant destroy
    ```

## Create a Docker cloud configuration

1. Open a web browser to Jenkins at http://192.168.33.10:8080/

2. Click on `Manage Jenkins`, `Configure System`

3. Click "Add a new cloud", "Mesos Cloud"

4. Enter "docker" as the name

5. Enter "http://172.17.42.1:2375" as the "Docker URL"

6. Click on "Add Docker Template" and select "Docker Template"

7. Enter "Docker Image" as "evarga/jenkins-slave"

8. Enter "Labels" as "evarga-jenkins-slave"

9. For "Credential" click "Add"

10. Make sure that "Kind" is "Username with password"

12. Enter "Username" and "Password" as "jenkins"

13. Click "Add"

14. Select "jenkins/******" as the "Credentials"

15. Click "Save" to save the configuration

## Create a Jenkins job
1. Click "create new jobs'

2. Enter "Item name" as "Sleep_hello"

3. Select "Freestyle project"

4. Click "OK" to create the project

5. Check "Docker Container"

6. Check "Restrict where this project can be run"

7. Enter "evarga-jenkins-slave" for "Label Expression"

8. Click "Add build step" and then "Execute shell"

9. Enter the following in the "Command" box

    ```
    sleep 10
    hostname
    echo Hello
    ```

10. Click "Save"

## Disable jobs on Master node
1. Click "Manage Jenkins", "Manage nodes"

2. Click on "master", "Configure"

3. Set "# of executors" to 0


