# Proviso Zerigo Plugin

This plugin gives you the ability to easily spin up and down ec2 servers, 
using a simple command line instruction.

## Version

Works with proviso 0.2.0 and greater.

## How to install?

    gem install proviso
    
    gem install zerigo_dns
    
    proviso plugins:install git://github.com/jackhq/proviso_zerigo.git
    
    # Create Config Settings
    
    proviso config:create zerigo
    proviso config:add zerigo user [value]
    proviso config:add zerigo token [token]
    proviso config:add zerigo type [type] 
    proviso config:add zerigo ttl [ttl]
  
    # The proviso.yml file needs to be in the current working directory.
    
    proviso config:list
    
    # You should see a config like the following:
    
    zerigo:
      user: user
      token: token
      type: A
      ttl: 15000
        
    # Ok if you have everything configured, you should be able to do the following:
    
    # Link Servers
    proviso zerigo:link staging.example.com 127.0.0.1
  
    # UnLink Servers
    proviso zerigo:unlink staging.example.com 127.0.0.1
    
    # If you need to override settings on the command line
    # just use -- followed by the parameter, it just must be after the values
    # proviso zerigo:[link|unlink] [url] [ip] [options]
    
    proviso zerigo:link staging.example.com 127.0.0.1 --ttl 15000
    
    
        
