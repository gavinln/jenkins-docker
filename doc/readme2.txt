Create a Docker cloud configuration
1. Open a web browser to Jenkins at http://192.168.33.10:8080/

2. Click on "Manage Jenkins", "Configure System"

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

14. Select "jenkins/*******" as the "Credentials"

15. Click "Save" to save the configuration

Create a Jenkins job
1. Click "create new jobs'

2. Enter "Item name" as "Sleep_hello"

3. Select "Freestyle project"

4. Click "OK" to create the project

5. Check "Docker Container"

6. Check "Restrict where this project can be run"

7. Enter "evarga-jenkins-slave" for "Label Expression"

8. Click "Add build step" and then "Execute shell"

9. Enter the following in the "Command" box
sleep 10
hostname
echo Hello

10. Click "Save"

Disable jobs on Master node
1. Click "Manage Jenkins", "Manage nodes"

2. Click on "master", "Configure"

3. Set "# of executors" to 0

Useful links
https://developer.jboss.org/people/pgier/blog/2014/06/30/on-demand-jenkins-slaves-using-docker?_sscc=t
