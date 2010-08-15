require 'zerigo_dns'

module Proviso::Command
  class Zerigo < Base
    def initialize(args)
      @args = args
      load_config
    end
    
    def link
      update_dns    
    end
    
    def unlink
      update_dns
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
      host = ::Zerigo::DNS::Host.update_or_create(zone.id, url, @type, @ttl, ip)      
    end
    
    
    def load_config
      zerigo_config = YAML.load_file('proviso.yml')["zerigo"]
      @user = zerigo_config['user']
      @password = zerigo_config['password']
      @type = zerigo_config['type']
      @ttl = zerigo_config['ttl']
    end
  end
end

