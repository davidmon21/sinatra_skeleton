require_relative 'skeleton/version.rb'

module Skeleton
  require 'sinatra'
  require_relative 'skeleton/controller.rb'
  require_relative 'skeleton/model.rb'
  require_relative 'skeleton/server.rb'
end