# -*- encoding: utf-8 -*-
# stub: has_metadata_column 1.1.2 ruby lib

Gem::Specification.new do |s|
  s.name = "has_metadata_column"
  s.version = "1.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Tim Morgan"]
  s.date = "2013-09-04"
  s.description = "Reduce your table width and migration overhead by moving non-indexed columns to a separate metadata column."
  s.email = "git@timothymorgan.info"
  s.extra_rdoc_files = ["LICENSE.txt", "README.md"]
  s.files = ["README.md", "has_metadata_column.gemspec", "lib/has_metadata_column.rb", "LICENSE.txt"]
  s.homepage = "http://github.com/riscfuture/has_metadata_column"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9")
  s.rubygems_version = "2.1.7"
  s.summary = "Schemaless metadata using JSON columns"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, [">= 4.0"])
      s.add_runtime_dependency(%q<boolean>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<sqlite3>, [">= 0"])
      s.add_development_dependency(%q<yard>, [">= 0"])
      s.add_development_dependency(%q<redcarpet>, [">= 0"])
      s.add_development_dependency(%q<jeweler>, [">= 0"])
    else
      s.add_dependency(%q<rails>, [">= 4.0"])
      s.add_dependency(%q<boolean>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<sqlite3>, [">= 0"])
      s.add_dependency(%q<yard>, [">= 0"])
      s.add_dependency(%q<redcarpet>, [">= 0"])
      s.add_dependency(%q<jeweler>, [">= 0"])
    end
  else
    s.add_dependency(%q<rails>, [">= 4.0"])
    s.add_dependency(%q<boolean>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<sqlite3>, [">= 0"])
    s.add_dependency(%q<yard>, [">= 0"])
    s.add_dependency(%q<redcarpet>, [">= 0"])
    s.add_dependency(%q<jeweler>, [">= 0"])
  end
end