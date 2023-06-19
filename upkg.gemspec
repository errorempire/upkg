# frozen_string_literal: true

require_relative 'lib/upkg/version'

Gem::Specification.new do |spec|
  spec.name = 'upkg'
  spec.version = Upkg::VERSION
  spec.authors = ['Bence Csizmadia']
  spec.licenses = ['MIT']

  spec.summary = 'Universal package manager'
  spec.homepage = 'https://github.com/errorempire/upkg'
  spec.required_ruby_version = '>= 2.6.0'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/errorempire/upkg'

  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor Gemfile])
    end
  end

  spec.executables = 'upkg'
  spec.require_paths = ['lib']

  spec.add_dependency 'colorize', '~> 0.8.1'
  spec.add_dependency 'i18n', '~> 1.14'
  spec.add_dependency 'OptionParser', '~> 0.5.1'
  spec.add_dependency 'toml-rb', '~> 2.2'

  spec.add_development_dependency 'fileutils', '~> 1.7', '>= 1.7.1'
  spec.add_development_dependency 'rake', '~> 13.0', '>= 13.0.6'
  spec.add_development_dependency 'rubocop', '~> 1.52'
end
