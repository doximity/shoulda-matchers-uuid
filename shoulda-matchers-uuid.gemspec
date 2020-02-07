# frozen_string_literal: true

require_relative "lib/shoulda/matchers/uuid/version"

Gem::Specification.new do |spec|
  spec.name          = "shoulda-matchers-uuid"
  spec.version       = Shoulda::Matchers::Uuid::VERSION
  spec.authors       = ["Valentino Stoll", "Ben Simpson"]
  spec.email         = ["vstoll@doximity.com", "bsimpson@doximity.com"]

  spec.summary       = "Adds support for MYSQL uuids in shoulda-matchers context"
  spec.description   = "This extends shoulda-matchers to allow validating binary uuids in models."
  spec.homepage      = "https://github.com/doximity/shoulda-matchers-uuid"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/doximity/shoulda-matchers-uuid"
  spec.metadata["changelog_uri"] = "https://github.com/doximity/shoulda-matchers-uuid/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features|vendor|tasks|tmp)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "shoulda-matchers"

  spec.add_development_dependency "activemodel", "> 5.0"
  spec.add_development_dependency "activerecord", "> 4"
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "byebug"
  spec.add_development_dependency "dox-style"
  spec.add_development_dependency "mysql-binuuid-rails"
  spec.add_development_dependency "mysql2"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec_junit_formatter"
  spec.add_development_dependency "sdoc"
end
