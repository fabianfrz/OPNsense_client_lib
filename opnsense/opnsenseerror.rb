module OPNsense
  class OPNsenseError
    attr_accessor :msg
    def initialize(msg)
      @msg = msg
    end

    def to_s
      @msg
    end
  end
end
