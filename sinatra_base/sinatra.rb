#!/usr/bin/env ruby

require 'rubygems'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'sass'
require './lib/dao'

set :bind, '0.0.0.0'

get "/" do
  @title = 'Home Page'
  erb :home
end

get '/about' do
  @title = 'About'
  erb :about
end

get '/contact' do
  @title = 'Contact'
  erb :contact
end

get "/styles.css" do
  scss :styles
end

not_found do
  @title = '404 Missing'
  erb :missing
end
