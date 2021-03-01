# app.rb

require 'sinatra'
require 'sinatra/activerecord'
require './environments'


get "/" do
  erb :home
end

get "/push" do
  erb :push
end

get "/sdk" do
  erb :sdk
end

get "/inc" do
  erb :inc
end

get "/ran" do
  erb :ran
end

get "/create" do
  dashboard_url = 'https://dashboard.heroku.com/'
  match = /(.*?)\.herokuapp\.com/.match(request.host)
  dashboard_url << "apps/#{match[1]}/resources" if match && match[1]
  redirect to(dashboard_url)
end


class Contact < ActiveRecord::Base
  self.table_name = 'salesforce.contact'
end

get "/contacts" do
  @contacts = Contact.all
  erb :index
end
