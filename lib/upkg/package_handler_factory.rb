# frozen_string_literal: true

module Upkg
  class PackageHandlerFactory
    HANDLER_MAPPING = {
      'homebrew' => -> { PackageHandlers::HomebrewHandler.new },
      'npm' => -> { PackageHandlers::NpmHandler.new },
      'dart' => -> { PackageHandlers::DartHandler.new },
      'gem' => -> { PackageHandlers::GemHandler.new }
    }.freeze

    def get_handler(source)
      HANDLER_MAPPING[source] || raise("Unknown package source #{source}")
    end
  end
end
