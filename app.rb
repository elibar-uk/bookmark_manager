
ENV["RACK_ENV"] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'

class Bookmark < Sinatra::Base

  get '/' do
    redirect '/links'
  end

  get '/links' do
    @links = Link.all
    erb :links
  end
  get '/links/new' do
    erb :form
  end

  get '/tags/:name' do
    tag = Tag.all(name: params[:name])
    @links = tag ? tag.links : []
    erb :links
  end

  post '/links' do
    link = Link.create(url: params[:url], title: params[:title])
    params[:tags].split(" ").each do |tag|
    link.tags << Tag.create(name: tag)
    end
    link.save
    redirect to('/links')
  end


 run! if app_file == $0
end
