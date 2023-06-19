# frozen_string_literal: true

module Upkg
  module PackageHandlers
    class HomebrewHandler < BaseHandler
      def install(package)
        CommandExecutor.execute(['brew', 'install', package])
      end

      def update(package)
        CommandExecutor.execute(['brew', 'upgrade', package])
      end
    end
  end
end
