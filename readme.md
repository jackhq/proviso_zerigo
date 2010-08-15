# Proviso Zerigo Plugin

This plugin gives you the ability to easily spin up and down ec2 servers, 
using a simple command line instruction.

## How to install?

    gem install proviso
    
    gem install zerigo_dns
    
    proviso plugins:install git://github.com/jackhq/proviso_zerigo.git
    
    # Create or Update proviso.yml file for configuration 
    
    # The proviso.yml file needs to be in the current working directory.
    
    # create a node called zerigo: and add the following criteria:
    
    zerigo:
      user: user
      token: token
      type: A
      ttl: 15000
        
    ## Future releases will let you specify these settings from the command line...
    
    # Ok if you have everything configured, you should be able to do the following:
    
    # Link Servers
    proviso zerigo:link staging.example.com 127.0.0.1
  
    # Create UnLink Servers
    proviso zerigo:unlink staging.example.com 127.0.0.1
    
    
## TODO

* Enable settings to be passed in the command line

    
