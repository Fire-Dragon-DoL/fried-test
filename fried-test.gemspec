
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "fried/test/version"

Gem::Specification.new do |spec|
  spec.name          = "fried-test"
  spec.version       = Fried::Test::VERSION
  spec.authors       = ["Fire-Dragon-DoL"]
  spec.email         = ["francesco.belladonna@gmail.com"]

  spec.summary       = %q{Minitest helpers and testing philosophy}
  spec.description   = %q{Minitest helpers and testing philosophy}
  spec.homepage      = "https://github.com/Fire-Dragon-DoL/fried-test"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "pry-byebug"

  spec.add_runtime_dependency "minitest"
  spec.add_runtime_dependency "minitest-reporters"
end
