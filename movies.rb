require 'rubygems'
require 'sinatra'

require './modelm'

get '/' do
  @movies = Movie.where('year < 2012 and year > 2000 and rating is not null and rating > 64 and rating < 100 and critic is not null and critic > 59').order('rating DESC')
  erb :index
end

get '/details/:movie' do
  @movie = Movie.where(:rt_id => params[:movie])[0]
  erb :details
end