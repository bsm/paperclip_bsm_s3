# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = '>= 1.8.7'
  s.required_rubygems_version = ">= 1.3.6"

  s.name        = "paperclip-bsm-s3"
  s.summary     = "Custom extensions to Paperclip"
  s.version     = '0.5.0'

  s.authors     = ["Dimitrij Denissenko"]
  s.email       = "dimitrij@blacksquaremedia.com"
  s.homepage    = "https://github.com/bsm/paperclip-bsm-s3"

  s.require_path = 'lib'
  s.files        = Dir['LICENSE', 'README.rdoc', 'lib/**/*', 'rails/**/*']

  s.add_dependency "paperclip", ">= 2.5.0", "< 2.6.0"
  s.add_dependency "aws-sdk"
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
  s.add_development_dependency "sqlite3-ruby"
end
