require 'singleton'
module OPNsense
  class Configuration < Hash
    include Singleton
  end
end
