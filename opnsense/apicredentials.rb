

module OPNsense
  class APICredentials
    attr_accessor :key, :secret, :base_url, :ca_file

    def initialize(k,s,b,ca_file)
      @key = k
      @secret = s
      @base_url = b
      @ca_file = ca_file
    end

    def information_present?
      return false if @key.nil? || @secret.nil? || @base_url.nil?
      return false unless @key.length > 0 && @secret.length > 0 && @base_url.length > 0
      return true
    end

    class << self
      def create_from_file(file)
        f = File.read(file)
        credentials = f.split("\n").map {|x| x.strip.split('=').last }
        APICredentials.new(credentials[0],credentials[1],'https://192.168.1.1/api/',nil)
      end
    end
  end
end


