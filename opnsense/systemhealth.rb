require 'uri'
module OPNsense
  class SystemHealth
    class << self

      def list
        request = OPNsense::Configuration.instance['request']
        request.get_request('diagnostics/systemhealth/getRRDlist/')['data']
      end
      
      def get_health_data(data,from,to,maxitems,inverse="false", detail="false")
        from ||= "0"
        to ||= "0"
        data ||= "wan-traffic"
        maxitems ||= "120"
        inverse ||= "false"
        detail ||= "false"
        
        request = OPNsense::Configuration.instance['request']
        request.get_request("diagnostics/systemhealth/getSystemHealth/" + URI.encode_www_form_component(data) + "/" + URI.encode_www_form_component(from) + "/" + 
                            URI.encode_www_form_component(to) + "/" + URI.encode_www_form_component(maxitems) + "/" + 
                            URI.encode_www_form_component(inverse) + "/" + URI.encode_www_form_component(detail))
      end
    end
  end
end
