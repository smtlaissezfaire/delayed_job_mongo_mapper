# -*- encoding: utf-8 -*-
require 'date'

Gem::Specification.new do |s|
  s.name              = 'delayed_job_mongo_mapper'
  s.summary           = "MongoMapper backend for delayed_job"
  s.version           = '1.0.10'
  s.authors           = ['Andrew Pariser', 'Chris Gaffney', 'Brandon Keepers', 'Adnan Ali', 'Scott Taylor']
  s.date              = Date.today.to_s
  s.email             = ['pariser@gmail.com', 'chris@collectiveidea.com', 'brandon@opensoul.com', 'adnan.ali@gmail.com', 'scott@railsnewbie.com']
  s.extra_rdoc_files  = ["LICENSE", "README.md"]
  s.files             = Dir.glob("{lib,spec}/**/*") + %w[LICENSE README.md]
  s.homepage          = 'http://github.com/smtlaissezfaire/delayed_job_mongo_mapper'
  s.rdoc_options      = ['--charset=UTF-8']
  s.require_paths     = ['lib']
  s.test_files        = Dir.glob('spec/**/*')

  # s.add_runtime_dependency      'mongo_mapper', '>= 0.15.0'
  s.add_runtime_dependency      'delayed_job'#,  '~> 4.1.1'
  s.add_runtime_dependency      'tzinfo',       '~> 1.2.2'
  s.add_development_dependency  'rspec',        '>= 3.0'
end
