Miscellaneous
1. Make sure Vagrantfile has
    vb.customize ["modifyvm", :id, "--memory", "4096"]

3. Check "Jenkins Scheduler" framework is in the Active Frameworks section
http://192.168.33.10:5050/#/frameworks

4. If you cannot see the slave logs add the following to the file below
c:\windows\system32\drivers\etc\hosts
192.168.33.10 mesos-jenkins

6. Update all the Jenkins plugins and restart the Jenkins server

7. Need to change the Jenkins URL from http://localhost:8080/ to 
http://192.168.33.10:8080/



Start Mesos master & slave
1. Login to the VM
vagrant ssh

2. Change to the scripts directory
cd /vagrant/scripts

3. Make sure to set LIBPROCESS_IP (otherwise only one slave will be visible)
export LIBPROCESS_IP=192.168.33.10

4. Start tmux with two panes
./tmux_mesos.sh

5. Start Mesos master
./master_mesos_start.sh

6. Switch to the other pane
Type Ctrl+b, o

7. Start Mesos slave (sudo important also when starting remote slave add --ip=)
sudo ./slave_mesos_start.sh

8. Detach from the Tmux session
Type Ctrl+b, d

9. To attach to the running session again
tmux attach-session -t mesos

10. Type Ctrl+c and exit to stop the mesos master and slave once you are finished with the system

Create a Jenkins slave
1. Change to the scripts directory
cd /vagrant/script

2. Create a Jenkins slave docker container for Node.js
./build_node_java.sh

Update Jenkins plugins
1. Open a web browser to Jenkins at http://192.168.33.10:8080/

2. Click on "Manage Jenkins", "Manage Plugins"

3. Click on "Select All" at the bottom of the page

4. Click on "Download now and install after restart" to update plugins

5. Click on "Restart Jenkins when installation is complete ..."

Configure Jenkins
1. Open a web browser to Jenkins at http://192.168.33.10:8080/

2. Click on "Manage Jenkins", "Configure System"

3. Click "Add a new cloud", "Mesos Cloud"

4. For "Mesos native library path" enter:
/usr/lib/libmesos.so

5. For "Mesos Master" enter:
192.168.33.10:5050

6. Click "Advanced..."

7. Modify "Label String" to node_java

8 Click "Advanced..." again

9. Select "Use Docker Containerizer"

10. Enter "node_java" as the Docker image

11. Click on "Test Connection" and make sure it says "Connected to Mesos successfully"

12. Click "Save"

Create a Jenkins job
1. Click "create new jobs'

2. Enter "Item name" as "Sleep_hello"

3. Select "Freestyle project"

4. Click "OK" to create the project

5. Click "Restrict where this project can be run"

6. Enter "mesos" in the "Label Expression" field

7. Click "Add build step" and then "Execute shell"

8. Enter the following in the "Command" box
sleep 10
hostname
echo Hello

9. Click "Save"

Build more docker containers for dynamic Jenkins slaves
1. Change to Docker container scripts directory
cd /vagrant/docker

2. Build all Docker containers
./build.sh

Create more Jenkins jobs
1. Change to the Jenkins scripts directory
cd /vagrant/jenkins

2. First get the Jenkins command line client
./get-jenkins-cli.sh

3. Create the Jenkins jobs
./jobs-create.sh

Add more Jenkins Docker slaves
1. Open a web browser to Jenkins at http://192.168.33.10:8080/

2. Click on "Manage Jenkins", "Configure System"

3. In the "Cloud section - Mesos Cloud", click "Advanced..."

4. Click "Add Slave Info"

5. Modify "Label String" to python_jk

6 Click "Advanced..." again

7. Select "Use Docker Containerizer"

8. Enter "python_jk" as the Docker image

9. Repat steps from 4 to 8 changing "Label String" and "Docker image"
each time to "ruby_jk", "golang_jk" and "haskell_jk"

10. Click "Save"


