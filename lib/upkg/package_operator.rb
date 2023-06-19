# frozen_string_literal: true

module Upkg
  class PackageOperator
    attr_reader :handler_factory, :package_data_manager

    def initialize(package_data_manager, handler_factory)
      @package_data_manager = package_data_manager
      @handler_factory = handler_factory
    end

    def operate_packages(operation)
      package_data = package_data_manager.load_package_data
      return unless package_data

      package_data['source'].each do |source|
        process_source(operation, source)
      end
    end

    def process_source(operation, source)
      source_name = source['name']
      handler = handler_factory.get_handler(source_name)
      print_operation(operation, source_name)

      source['packages'].each do |package|
        process_package(operation, package, handler)
      end
    end

    private

    def process_package(operation, package, handler)
      print_package(operation, package)
      handler.send(operation, package)
    end

    def print_operation(operation, source_name)
      case operation
      when :install
        puts I18n.t('source', name: source_name.yellow)
      when :update
        puts I18n.t('source', name: source_name.blue)
      end
    end

    def print_package(operation, package)
      case operation
      when :install
        puts I18n.t('package.install', package: package.green)
      when :update
        puts I18n.t('package.update', package: package.yellow)
      end
    end
  end
end
