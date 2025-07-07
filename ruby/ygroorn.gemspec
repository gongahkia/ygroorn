Gem::Specification.new do |spec|
  spec.name          = "ygroorn"
  spec.version       = "0.1.0"
  spec.authors       = ["Gabriel Ong"]
  spec.summary       = "You're Gonna Run Out Of Repo Names"
  spec.files         = Dir["lib/**/*.rb"]
  spec.require_paths = ["lib"]
  spec.add_dependency "thor"
  spec.add_development_dependency "rspec"
end