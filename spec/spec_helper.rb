require 'rubygems'
require 'bundler/setup'
$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'rspec'
require 'delayed_job_mongo_mapper'
require 'delayed/backend/shared_spec'
require 'pry-byebug'

MongoMapper.database = 'dl_spec'
Mongo::Logger.logger.level = Logger::FATAL

class Story
  include ::MongoMapper::Document
  def tell; text; end
  def whatever(n, _); tell*n; end
  def self.count; end

  handle_asynchronously :whatever
end
