# frozen_string_literal: true

require_relative "lib/altered_access/version"

Gem::Specification.new do |spec|
  spec.name = "altered_access"
  spec.version = AlteredAccess::VERSION
  spec.authors = ["Nathan Wise"]
  spec.email = ["nathanwise@gmail.com"]

  spec.summary = "AlteredAccess is a gem that provides a simple interface " \
                 "for interacting with the Altered Access API."
  spec.description = "AlteredAccess is a gem that provides a simple " \
                     "interface for interacting with the Altered Access API." \
                     "It is a simple Ruby wrapper around the Altered Access " \
                     "API. It is designed to make it easy to interact with " \
                     "the Altered Access API in a Ruby application."

  spec.homepage = "https://github.com/nwise/altered_access"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  # spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] =
    "https://github.com/nwise/altered_access/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been
  # added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(
    %w[git ls-files -z],
    chdir: __dir__,
    err: IO::NULL
  ) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(
          *%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile]
        )
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "faraday"
  spec.add_dependency "json"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
  spec.metadata["rubygems_mfa_required"] = "true"
end
