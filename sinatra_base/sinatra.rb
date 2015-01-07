#!/usr/bin/env ruby

require 'rubygems'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'sass'
require './lib/dao'

set :bind, '0.0.0.0'

enable :sessions

userTable = {}

helpers do
  def login?
    !!session[:username].nil
  end

  def username
    return session[:username]
  end
end

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

post '/login' do
  if userTable.has_key?(params[:username])
    user = userTable[params[:username]]
    if user[:passwordhash] == BCrypt::Engine.hash_secret(params[:password], user[:salt])
      session[:username] = params[:username]
    end
  end
  erb :home
end

get '/signup' do
  erb :signup
end

post '/signup' do
  password_salt = BCrypt::Engine.generate_salt
  password_hash = BCrypt::Engine.hash_secret(params[:password], password_salt)

  #ideally this would be saved into a database, hash used just for sample
  userTable[params[:username]] = {
    :salt => password_salt,
    :passwordhash => password_hash
  }

  redirect "/"
end

get "/styles.css" do
  scss :styles
end

not_found do
  @title = '404 Missing'
  erb :missing
end
