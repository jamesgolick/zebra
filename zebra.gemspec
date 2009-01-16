# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{zebra}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["James Golick"]
  s.date = %q{2009-01-16}
  s.description = %q{TODO}
  s.email = %q{james@giraffesoft.ca}
  s.files = ["README.rdoc", "VERSION.yml", "lib/zebra.rb", "test/context_test.rb", "test/matchy_test.rb", "test/test_helper.rb"]
  s.homepage = %q{http://github.com/giraffesoft/zebra}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{TODO}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<jeremymcanally-context>, [">= 0.5.2"])
      s.add_runtime_dependency(%q<jeremymcanally-matchy>, [">= 0.0.1"])
      s.add_runtime_dependency(%q<ParseTree>, [">= 3.0.2"])
      s.add_runtime_dependency(%q<ruby2ruby>, [">= 1.2.1"])
    else
      s.add_dependency(%q<jeremymcanally-context>, [">= 0.5.2"])
      s.add_dependency(%q<jeremymcanally-matchy>, [">= 0.0.1"])
      s.add_dependency(%q<ParseTree>, [">= 3.0.2"])
      s.add_dependency(%q<ruby2ruby>, [">= 1.2.1"])
    end
  else
    s.add_dependency(%q<jeremymcanally-context>, [">= 0.5.2"])
    s.add_dependency(%q<jeremymcanally-matchy>, [">= 0.0.1"])
    s.add_dependency(%q<ParseTree>, [">= 3.0.2"])
    s.add_dependency(%q<ruby2ruby>, [">= 1.2.1"])
  end
end
