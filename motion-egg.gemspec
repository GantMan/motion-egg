# -*- encoding: utf-8 -*-

Version = "0.1"

Gem::Specification.new do |spec|
  spec.name = 'motion-egg'
  spec.summary = 'Automatically add an easter egg to your iOS app'
  spec.description = "motion-egg lets you perform the Konami code and get a lovely surprise in your app" 
  spec.author = 'Gant Laborde'
  spec.email = 'gant@iconoclastlabs.com'
  spec.homepage    = "https://github.com/gantman/motion-egg"
  spec.version = Version

  files = []
  # files << 'README.md'
  # files << 'LICENSE'
  files.concat(Dir.glob('lib/**/*.rb'))
  spec.files = files
end