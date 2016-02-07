require 'uri'

module OPNsense
  class Voucher
    class << self
      def list_providers
        request = OPNsense::Configuration.instance['request']
        res = request.get_request('captiveportal/voucher/listProviders')
      end

      def create!(voucher_provider,voucher_quantity,voucher_validity,voucher_groupname)
        request = OPNsense::Configuration.instance['request']
        encoded_provider = URI.encode_www_form_component(voucher_provider)
        request.post_request('captiveportal/voucher/generateVouchers/' + encoded_provider + '/', { 'count' => voucher_quantity, 'validity' => voucher_validity,'vouchergroup' => voucher_groupname})
      end
    end
  end
end
