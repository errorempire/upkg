# frozen_string_literal: true

module Upkg
  class PackageInstaller
    attr_reader :handler_factory, :package_data_manager, :package_operator

    def initialize(file_path)
      @handler_factory = PackageHandlerFactory.new
      @package_data_manager = PackageDataManager.new(file_path)
      @package_operator = PackageOperator.new(package_data_manager, handler_factory)
    end

    def install_packages
      package_operator.operate_packages(:install)
    end

    def update_packages
      package_operator.operate_packages(:update)
    end

    def add_package(source_name, package_name)
      package_data = package_data_manager.load_package_data
      return unless package_data

      source = package_data_manager.find_source(package_data, source_name)
      return unless source

      package_data_manager.add_package_to_source(source, package_name)
      package_data_manager.write_package_data(package_data)

      puts I18n.t('package.add', package_name: package_name, source_name: source_name)
    end
  end
end
