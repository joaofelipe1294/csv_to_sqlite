require_relative 'lib/csv_to_sqlite/version'

Gem::Specification.new do |spec|
  spec.name          = "csv_to_sqlite"
  spec.version       = CsvToSqlite::VERSION
  spec.authors       = ["joaofelipe"]
  spec.email         = ["joaofelipe1294@gmail.com"]

  spec.summary       = %q{An easy way to convert a csv file into SQLite database.}
  spec.description   = %q{Add a better description.}
  spec.homepage      = "https://github.com/joaofelipe1294/csv_to_sqlite"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/joaofelipe1294/csv_to_sqlite"
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.executables << 'csv_to_sqlite'
  spec.require_paths = ["lib"]
end
