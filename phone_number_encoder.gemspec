
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "phone_number_encoder/version"

Gem::Specification.new do |spec|
  spec.name          = "phone_number_encoder"
  spec.version       = PhoneNumberEncoder::VERSION
  spec.authors       = ["Gaurav Gupta"]
  spec.email         = ["gauravkumargupta666@gmail.com"]

  spec.summary       = "Phone Number Encoder"
  spec.description   = "Encodes phone number into words"
  spec.homepage      = "https://github.com/gauravgupta121/phone_number_encoder"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
