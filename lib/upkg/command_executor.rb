# frozen_string_literal: true

module Upkg
  class CommandExecutor
    def self.execute(cmd)
      stdout, stderr, status = Open3.capture3(*cmd)
      puts I18n.t('errors.command_output', output: stdout.green) unless stdout.empty?
      puts I18n.t('errors.command_errors', errors: stderr.red) unless stderr.empty?
      puts I18n.t('errors.command_exit_status', status: status.exitstatus) unless status.exitstatus.zero?
      puts I18n.t('separator')
    end
  end
end
