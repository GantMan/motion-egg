# -*- encoding: utf-8 -*-
require File.expand_path('../lib/motion-egg/version', __FILE__)

Gem::Specification.new do |spec|
  spec.name         = 'motion-egg'
  spec.summary      = 'Automatically add an easter egg to your iOS app'
  spec.description  = "motion-egg lets you perform the Konami code and get a lovely surprise in your app" 
  spec.author       = 'Gant Laborde'
  spec.email        = 'gant@iconoclastlabs.com'
  spec.homepage     = "https://github.com/GantMan/motion-egg"
  spec.version      = MotionEgg::VERSION
  spec.license      = "MIT"

  files = []
  files << 'README.md'
  files.concat(Dir.glob('lib/**/*.rb'))
  spec.files = files
  spec.require_paths = ["lib"]
  spec.add_development_dependency("rake")
end