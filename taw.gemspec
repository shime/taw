lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "taw/version"

Gem::Specification.new do |spec|
  spec.name          = "taw"
  spec.version       = Taw::VERSION
  spec.authors       = ["Hrvoje Šimić"]
  spec.email         = ["shime@twobucks.co"]

  spec.summary       = %q{Time ago in words helper for non Rails projects.}
  spec.homepage      = "https://github.com/shime/taw"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
