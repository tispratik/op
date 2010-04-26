# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{email_veracity}
  s.version = "0.5.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Carsten Nielsen"]
  s.date = %q{2010-01-29}
  s.description = %q{Email Veracity abstracts an email address into a series of objects which makes it easy to see if an address is invalid, and if so, why.}
  s.email = %q{heycarsten@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.md"
  ]
  s.files = [
    ".gitignore",
     "CONTRIBUTORS",
     "LICENSE",
     "README.md",
     "Rakefile",
     "VERSION",
     "email_veracity.gemspec",
     "lib/email_veracity.rb",
     "lib/email_veracity/address.rb",
     "lib/email_veracity/config.rb",
     "lib/email_veracity/domain.rb",
     "lib/email_veracity/resolver.rb",
     "lib/email_veracity/server.rb",
     "lib/email_veracity/utils.rb",
     "lib/email_veracity/validatability.rb",
     "test/helper.rb",
     "test/test_address.rb",
     "test/test_config.rb",
     "test/test_domain.rb",
     "test/test_resolver.rb",
     "test/test_server.rb",
     "test/test_utils.rb",
     "test/test_validatability.rb"
  ]
  s.homepage = %q{http://github.com/heycarsten/email-veracity}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{A simple library for checking the real-world validity of email addresses.}
  s.test_files = [
    "test/helper.rb",
     "test/test_address.rb",
     "test/test_config.rb",
     "test/test_domain.rb",
     "test/test_resolver.rb",
     "test/test_server.rb",
     "test/test_utils.rb",
     "test/test_validatability.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<mocha>, [">= 0.9.8"])
      s.add_development_dependency(%q<shoulda>, [">= 2.10.2"])
    else
      s.add_dependency(%q<mocha>, [">= 0.9.8"])
      s.add_dependency(%q<shoulda>, [">= 2.10.2"])
    end
  else
    s.add_dependency(%q<mocha>, [">= 0.9.8"])
    s.add_dependency(%q<shoulda>, [">= 2.10.2"])
  end
end

