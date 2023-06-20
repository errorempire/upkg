# frozen_string_literal: true

module Upkg
  require 'toml-rb'
  require 'colorize'
  require 'open3'
  require 'i18n'

  require_relative 'upkg/package_installer'
  require_relative 'upkg/package_handler_factory'
  require_relative 'upkg/package_data_manager'
  require_relative 'upkg/package_operator'
  require_relative 'upkg/command_executor'
  require_relative 'upkg/version'

  I18n.load_path << Dir["#{File.expand_path('config/locales')}/*.yaml"]
  I18n.config.available_locales = :en
  I18n.default_locale = :en
end
