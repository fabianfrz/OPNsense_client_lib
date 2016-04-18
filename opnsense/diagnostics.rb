require 'uri'
module OPNsense
  module Diagnostics
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
    module NetworkInsight
      class << self
        # seems to be not working at the moment
        #def top
        #  request = OPNsense::Configuration.instance['request']
        #  request.get_request('diagnostics/networkinsight/top')
        #end
        def get_interfaces
          request = OPNsense::Configuration.instance['request']
          request.get_request("diagnostics/networkinsight/getinterfaces")
        end
        def get_services
          request = OPNsense::Configuration.instance['request']
          # keys need to be converted to an integer
          request.get_request("diagnostics/networkinsight/getservices").map do |key, value|
            [key.to_i, value]
          end.to_h
        end
        def get_protocols
          request = OPNsense::Configuration.instance['request']
          # keys need to be converted to an integer
          request.get_request("diagnostics/networkinsight/getprotocols").map do |key, value|
            [key.to_i, value]
          end.to_h
        end
      end
    end
  end
end
