# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "middleman-humans"
  s.version     = "0.0.1"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Murray Summers"]
  s.email       = ["murray.sum@gmail.com"]
  s.homepage    = "http://example.com"
  s.summary     = "Generate a humans.txt"
  s.description = "Generate a humans.txt"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # The version of middleman-core your extension depends on
  s.add_runtime_dependency("middleman-core", [">= 4.1.12"])

  # Additional dependencies
  # s.add_runtime_dependency("gem-name", "gem-version")
end
