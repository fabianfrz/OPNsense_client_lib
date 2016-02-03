
module OPNsense
  class FirmwareUpdate
    attr_accessor :connection, :repository, :last_check, :updates, :download_size, :extra_space_required
    attr_accessor :new_packages, :reinstall_packages, :upgrade_packages, :upgrade_needs_reboot, :status_msg
    attr_accessor :status, :status_upgrade_action
    #
    #
    def initialize
      @new_packages = []
      @reinstall_packages = []
      @upgrade_packages = []
    end


    class << self
      def fetch
        request = OPNsense::Configuration.instance['request']
        res = request.get_request('core/firmware/status')
        update = FirmwareUpdate.new
        update.status = res['status']
        update.status_msg = res['status_msg']
        update.connection = res['connection']
        update.repository = res['repository']
        update.last_check = res['last_check']
        update.updates = res['updates']
        update.download_size = res['download_size']
        update.extra_space_required = res['extra_space_required']
        update.new_packages = res['new_packages']
        update.reinstall_packages = res['reinstall_packages']
        update.upgrade_packages = res['upgrade_packages']
        update.upgrade_needs_reboot = res['upgrade_needs_reboot']
        update.status_upgrade_action = res['status_upgrade_action']
        return update
      end

      def upgrade!
        request = OPNsense::Configuration.instance['request']
        request.post_request('core/firmware/upgrade', '{"upgrade":"all"}')
      end
    end
  end
end
