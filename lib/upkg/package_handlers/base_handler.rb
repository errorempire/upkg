# frozen_string_literal: true

module Upkg
  module PackageHandlers
    class BaseHandler
      def install(package)
        raise NotImplementedError, 'Subclass must implement #install.'
      end

      def update(package)
        raise NotImplementedError, 'Subclass must implement #update.'
      end
    end
  end
end
