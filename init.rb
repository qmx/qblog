$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "lib"))
require "rubygems"
require "bundler"
Bundler.setup

require "sinatra/base"
require "haml"
require "qblog"

require 'active_record'

dbconfig = YAML.load(File.read('config/database.yml'))
ActiveRecord::Base.establish_connection dbconfig['production']
