# -*- encoding: utf-8 -*-
# stub: git 1.2.6 ruby lib

Gem::Specification.new do |s|
  s.name = "git"
  s.version = "1.2.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Scott Chacon"]
  s.date = "2013-10-18"
  s.email = "schacon@gmail.com"
  s.extra_rdoc_files = ["README.md"]
  s.files = ["LICENSE", "lib/git.rb", "lib/git/author.rb", "lib/git/base.rb", "lib/git/branch.rb", "lib/git/branches.rb", "lib/git/diff.rb", "lib/git/index.rb", "lib/git/lib.rb", "lib/git/log.rb", "lib/git/object.rb", "lib/git/path.rb", "lib/git/remote.rb", "lib/git/repository.rb", "lib/git/stash.rb", "lib/git/stashes.rb", "lib/git/status.rb", "lib/git/version.rb", "lib/git/working_directory.rb", "README.md"]
  s.homepage = "http://github.com/schacon/ruby-git"
  s.licenses = ["MIT"]
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.requirements = ["git 1.6.0.0, or greater"]
  s.rubygems_version = "2.1.7"
  s.summary = "Ruby/Git is a Ruby library that can be used to create, read and manipulate Git repositories by wrapping system calls to the git binary."

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rdoc>, [">= 0"])
      s.add_development_dependency(%q<test-unit>, [">= 0"])
    else
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rdoc>, [">= 0"])
      s.add_dependency(%q<test-unit>, [">= 0"])
    end
  else
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rdoc>, [">= 0"])
    s.add_dependency(%q<test-unit>, [">= 0"])
  end
end
