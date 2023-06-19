# frozen_string_literal: true

module Upkg
  module PackageHandlers
    class NpmHandler < BaseHandler
      def install(package)
        CommandExecutor.execute(['npm', 'install', '-g', package])
      end

      def update(package)
        CommandExecutor.execute(['npm', 'update', '-g', package])
      end
    end
  end
end
