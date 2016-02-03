require 'net/http'
require 'openssl'
require 'json'
require_relative 'opnsenseerror'
require_relative 'apicredentials'
require_relative 'configuration'
module OPNsense
  class Request
    def initialize(credentials)
      @credentials = credentials
      Configuration.instance['request'] = self
    end
    def get_request(location)
      uri = URI(@credentials.base_url + location)
      request = Net::HTTP::Get.new(uri)
      get_response(request, uri)
    end

    def post_request(location, data)
      uri = URI(@credentials.base_url + location)
      request = Net::HTTP::Post.new(uri)
      request.body = ((data.is_a? String) ? data : JSON.generate(data))
      request.content_type = 'application/json'
      get_response(request,uri)
    end

    def get_response(request, uri)
      request.basic_auth @credentials.key, @credentials.secret
      res = Net::HTTP.start(uri.hostname, uri.port,:use_ssl => uri.scheme == 'https', :ca_file => @credentials.ca_file) do |http|
          http.request(request)
      end
      raise OPNsenseError.new("Something happened while acessing the API") unless res.code == '200'
      JSON.parse(res.body)
    end
  end
end

