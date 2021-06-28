# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name        = "firefox-hash-generator"
  s.version     = "1.0.0"
  s.platform    = Gem::Platform::RUBY
  s.license     = "MIT"
  s.authors     = ["Oleg Pudeyev"]
  s.email       = "code@olegp.name"
  s.homepage    = "https://github.com/p/firefox-hash-generator"
  s.summary     = "firefox-hash-generator-1.0.0"
  s.description = "Firefox/Waterfox/Pale Moon search engine hash generator"

  s.files            = `git ls-files -- lib/*`.split("\n")
  s.files           += %w[README.md LICENSE]
  s.test_files       = []
  s.bindir           = 'bin'
  s.executables      = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.rdoc_options     = ["--charset=UTF-8"]
  s.require_path     = "lib"
end
