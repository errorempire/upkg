# frozen_string_literal: true

module Upkg
  module PackageHandlers
    class DartHandler < BaseHandler
      def install(package)
        CommandExecutor.execute(['dart', 'pub', 'add', package])
      end

      def update(package)
        CommandExecutor.execute(['dart', 'pub', 'upgrade', package])
      end
    end
  end
end
