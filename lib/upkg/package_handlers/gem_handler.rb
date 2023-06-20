# frozen_string_literal: true

module Upkg
  module PackageHandlers
    class GemHandler < BaseHandler
      def install(package)
        CommandExecutor.execute(['gem', 'install', package])
      end

      def update(package)
        CommandExecutor.execute(['gem', 'update', package])
      end
    end
  end
end
