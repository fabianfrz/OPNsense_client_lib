require 'uri'
module OPNsense
  class Diagnostics
    class << self  
      def ndp
        request = OPNsense::Configuration.instance['request']
        request.get_request("diagnostics/interface/getNdp")
      end
      
      def arp
        request = OPNsense::Configuration.instance['request']
        request.get_request("diagnostics/interface/getArp")
      end
    end
  end
end