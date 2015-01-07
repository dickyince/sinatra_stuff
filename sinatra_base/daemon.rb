require 'rubygems'
require 'daemons'

dir = ENV['HOME'] + '/sinatra_stuff/sinatra_basic'
Daemons.run_proc('sinatra.rb', {:dir_mode => :normal, :dir => "/opt/pids/sinatra"}) do
  Dir.chdir(dir)
  exec "sinatra.rb"
end
