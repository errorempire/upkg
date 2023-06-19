# frozen_string_literal: true

module Upkg
  class PackageInstaller
    attr_reader :file_path, :handler_factory

    def initialize(file_path)
      @file_path = file_path
      @handler_factory = PackageHandlerFactory.new
    end

    def install_packages
      operate_packages(:install)
    end

    def update_packages
      operate_packages(:update)
    end

    def add_package(source_name, package_name)
      package_data = load_package_data
      return unless package_data

      source = find_source(package_data, source_name)
      return unless source

      add_package_to_source(source, package_name)
      write_package_data(package_data)

      puts "Package '#{package_name}' added to '#{source_name}'"
    end

    private

    def operate_packages(operation)
      package_data = load_package_data
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

    def process_package(operation, package, handler)
      print_package(operation, package)
      handler.send(operation, package)
    end

    def load_package_data
      unless File.exist?(file_path)
        puts I18n.t('errors.file_not_found', path: file_path)
        return
      end

      TomlRB.load_file(file_path)
    end

    def find_source(package_data, source_name)
      source = package_data['source'].find { |s| s['name'] == source_name }
      unless source
        puts I18n.t('errors.source_not_found', source_name: source_name)
        return
      end
      source
    end

    def add_package_to_source(source, package_name)
      source['packages'] << package_name
    end

    def write_package_data(package_data)
      File.write(file_path, TomlRB.dump(package_data))
    end

    def print_operation(operation, source_name)
      case operation
      when :install
        puts I18n.t('source', name: source_name.yellow)
      when :update
        puts I18n.t('updating_source', name: source_name.blue)
      end
    end

    def print_package(operation, package)
      case operation
      when :install
        puts I18n.t('installing_package', package: package.green)
      when :update
        puts I18n.t('updating_package', package: package.yellow)
      end
    end
  end
end
