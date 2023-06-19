# frozen_string_literal: true

module Upkg
  class PackageHandlerFactory
    def get_handler(source)
      case source
      when 'homebrew'
        PackageHandlers::HomebrewHandler.new
      when 'npm'
        PackageHandlers::NpmHandler.new
      when 'dart'
        PackageHandlers::DartHandler.new
      else
        raise "Unknown package source #{source}"
      end
    end
  end
end
