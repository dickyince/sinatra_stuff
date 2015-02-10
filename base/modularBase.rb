#!/usr/bin/env ruby

require 'rubygems'
require 'sinatra/base'
require 'sass'

class ModularBase < Sinatra::Base
  set :bind, '0.0.0.0'

  run! if __FILE__ == $0
end
