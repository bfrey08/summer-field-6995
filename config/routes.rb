Rails.application.routes.draw do

  get '/studios', to: 'studios#index'

  get '/studios/:id/movie', to: 'movies#show'
end
