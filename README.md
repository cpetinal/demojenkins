# practice continuous integration

This is the continuous integration Jenkins for Demo

# steps to prepare the demo:

1-First of all we will build the docker image necesary to lauch Jenkins with the desired configuration. to do that we call the make build stage.

Launch: "make version=[DESIRED_DOCKER_IMAGE_VERSION] build"
ej: "make version=0.7.0 build"

2-We launch the the init script to start the Jenkins container. (note The owner of the generated volume folder will be 1000, to avoid problems with the jenkins user into the container. if you prefer you can launch the container manually.) 

Launch: "sudo /bin/init.sh -v [DOCKER_IMAGE_VERSION] -m [VOLUME_LOCATION]"
ej: "sudo ./bin/init.sh -v '0.7.0' -m '/home/cpetinal/king/vol/jenkins7'"

3-put into your browser "localhost:8080" and you will see the initial admin web page"

4-we take the admin password from the log of the container or for the location into the container (/var/jenkins_home/secrets/initialAdminPassword) IMPORTAN READ STEP 5

5-Ommit the plugin configuration. During the docker build stage jenkins have downloaded all the necesary plugins to the practice. select the X to close this windows.

6-Enter jenkins with the shared library and the github token configurated via jcasc.

7- But to finsh it, we need create the configuration job and for this we will execute the createjob script

Launch: sudo ./bin/createjob.sh '[container-name]' '[Volumen location]'
ej: sudo ./bin/createjob.sh 'king-practice' '/home/cpetinal/king/vol/jenkins7'

8-now jenkins will be reboot and when you login another time and go to the main web page you can see now the multibranch pipeline coolgame in the Dashboard

9-first of all go to configuration to put the githubToken if not work create it another time (Jenkins job syncronized problem).
    - Go to credentials 
    - select jenkins
    - Global credentials (unrestricted)
    - Select token 2
    - update
    - into the field Password put the code from the pdf

10-reindex the pipeline and you will see coolgame repository syncronized with the jenkins.



