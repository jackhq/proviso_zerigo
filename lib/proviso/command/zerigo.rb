require 'zerigo_dns'

module Proviso::Command
  class Zerigo < Base
    
    attr_accessor :user, :token, :ttl, :type
    def initialize(args)
      @args = args
      load_config
      ::Zerigo::DNS::Base.user = @user
      ::Zerigo::DNS::Base.password = @token
    end
    
    def list
      
    end
    
    
    def link
      update_dns
      display "Successfully linked #{@args.first} to #{@args[1]}", true  
      true  
    end
    
    def unlink
      update_dns
      display "Successfully unlinked #{@args.first}", true    
      true
    end
  
  private
  
    def update_dns
      url = @args.first
      ip = @args[1] || ''
      prefix, subject, suffix = url.split('.')
      domain = [subject,suffix].join('.')
      # find or create domain
      zone = ::Zerigo::DNS::Zone.find_or_create(domain)
      # find or create host
      host = ::Zerigo::DNS::Host.update_or_create(zone.id, prefix, @type, @ttl, ip)      
    end
    
    
    def load_config
      if File.exists?(yaml_file)
        zerigo_config = YAML.load_file(yaml_file)["zerigo"]
        @user = get_option_value('user', zerigo_config)
        @token = get_option_value('token', zerigo_config)
        @type = get_option_value('type', zerigo_config)
        @ttl = get_option_value('ttl', zerigo_config)
        display "Config File Loaded...", true
      else
        error "proviso.yml config file not found."
      end
    end
    
    def get_option_value(option, config)
      extract_option("--#{option}") or config[option]
    end
    
  end
end

