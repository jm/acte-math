require 'rubygems'
require 'vendor/rack/lib/rack'
require 'vendor/sinatra/lib/sinatra.rb'

path = "/home/jmcanally/awesomemathgame.com/current"

set :root, path
set :views, path + '/views'
set :public, path + '/public'
set :environment, :production
disable :run

require 'web.rb'
run Sinatra::Application
