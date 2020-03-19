Based on official JFrog documentation

Docker Installation
Please run the installJF.sh this will set up the working directory and will create system.yaml 
for you 
    
    ./installJF.sh

Customize the product configuration:
you can find config.yaml file where you can customize your repository configuration


Start the Artifactory container.

    docker run --name artifactory -v $JFROG_HOME/artifactory/var/:/var/opt/jfrog/artifactory -d -p 8081:8081 -p 8082:8082 docker.bintray.io/jfrog/artifactory-<pro|oss|cpp-ce>:latest

Please Manage Artifactory using native Docker commands.

    docker ps
    

Access Artifactory from your browser at: http://SERVER_HOSTNAME:8082/ui/. 
    
    http://localhost:8082/ui/

Check Artifactory Log.

    docker logs -f artifactory

And finally you can update the repository configuration making the API call here:

    curl -uadmin:password -XPATCH "http://localhost:8081/artifactory/api/system/configuration" -H "Content-Type:application/yaml" -T config.yml            
    
    
Please NOTE! ```DEFAULT USER : admin    ```
```Default password: password```    

PLEASE ALSO NOTE ON THE FREE TRAIL YOU CAN CONFIGURE ONLY CONAN OR GENERIC REPOSITORIES

To access the remote/local repository:

    http://my-remote-site:8081/artifactory/api/docker/<repository key> -how do I know my repository key
    
To check configuration:

    curl -uadmin:password "http://localhost:8081/artifactory/api/system/configuration"
    
Re-setting the password for artifactory:
The file "bootstrap.creds" need to be placed under JFROG_HOME/artifactory/var/etc/access

    chmod 600 bootstrap.creds
             
restart artifactory instance.

Changing password:

    curl -XPATCH -uaccess-admin:password http://localhost:8040/access/api/v1/users/access-admin -H "Content-Type: application/json" -d '{ "password": "newStrongPassword" }'

