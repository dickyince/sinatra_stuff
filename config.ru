require 'sinatra/base'

require './base/homeController'

map('/') { run HomeController }
