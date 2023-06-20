# frozen_string_literal: true

module Upkg
  class PackageDataManager
    attr_reader :file_path

    def initialize(file_path)
      @file_path = file_path
    end

    def load_package_data
      unless File.exist?(file_path)
        puts I18n.t('error.file_not_found', path: file_path)
        return
      end

      TomlRB.load_file(file_path)
    end

    def find_source(package_data, source_name)
      source = package_data['source'].find { |s| s['name'] == source_name }
      unless source
        puts I18n.t('error.source_not_found', source_name: source_name)
        return
      end
      source
    end

    def add_package_to_source(source, package_name)
      source['packages'] ||= []
      source['packages'] << package_name
    end

    def write_package_data(package_data)
      File.write(file_path, TomlRB.dump(package_data))
    end

    def remove_package_from_source(source, package_name)
      source['packages'].delete(package_name)
    end
  end
end
