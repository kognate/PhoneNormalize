# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{phonenormalize}
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Josh Smith"]
  s.cert_chain = ["/Users/jsmith/.gem/gem-public_cert.pem"]
  s.date = %q{2009-09-08}
  s.default_executable = %q{phonenormalize}
  s.description = %q{}
  s.email = ["kognate@gmail.com"]
  s.executables = ["phonenormalize"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "README.txt"]
  s.files = ["History.txt", "Manifest.txt", "README.txt", "Rakefile", "bin/phonenormalize", "lib/phonenormalize.rb", "test/test_phonenormalize.rb"]
  s.has_rdoc = true
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{phonenormalize}
  s.rubygems_version = %q{1.3.1}
  s.signing_key = %q{/Users/jsmith/.gem/gem-private_key.pem}
  s.summary = %q{}
  s.test_files = ["test/test_phonenormalize.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<hoe>, [">= 1.8.3"])
    else
      s.add_dependency(%q<hoe>, [">= 1.8.3"])
    end
  else
    s.add_dependency(%q<hoe>, [">= 1.8.3"])
  end
end
