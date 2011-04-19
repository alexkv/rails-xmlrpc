# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rails-xmlrpc}
  s.version = "0.3.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Aleksei Kvitinskii","Will Koffel"]
  s.date = %q{2011-04-10}
  s.description = %q{Gem allows you to use our RubyOnRails project like XMLRPC server.}
  s.email = %q{aleksei.wm@gmail.com}
  s.extra_rdoc_files = [
    "README.rdoc"
  ]
  s.files = [
     ".gitignore",
     "README.rdoc",
     "Rakefile",
     "init.rb",
     "lib/action_controller/acts/rails_xmlrpc.rb",
     "lib/rails-xmlrpc.rb",
     "test/helper.rb",
     "test/test_rails-xmlrpc.rb",
     "rails-xmlrpc.gemspec"
  ]
  s.homepage = %q{http://github.com/Axy/rails-xmlrpc}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Gem allows you to use our RubyOnRails project like XMLRPC server .}
  s.test_files = [
    "test/helper.rb",
    "test/test_rails-xmlrpc.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<thoughtbot-shoulda>, [">= 0"])
    else
      s.add_dependency(%q<thoughtbot-shoulda>, [">= 0"])
    end
  else
    s.add_dependency(%q<thoughtbot-shoulda>, [">= 0"])
  end
end

