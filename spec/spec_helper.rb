$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'proviso'
require 'proviso/command'
require 'proviso/command/zerigo'

require 'spec'
require 'spec/autorun'



Spec::Runner.configure do |config|
  
end
