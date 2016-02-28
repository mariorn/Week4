Rails.application.routes.draw do

  get '/' => 'site#home'
  get '/about' => 'site#about'
  post '/concerts/by_price' => 'concerts#price'
  get '/concerts/by_price' => 'concerts#price'
  get '/artists' => 'artists#index'
  get '/artists' => 'artists#index'
  get '/artist' => 'artists#show'

  resources :concerts do 
    resources :artists
  end

  get '/artist/:artist_id/concerts' => 'artists#concerts'
  get '/artist/:artist_id/details' => 'artists#details'
  get '/artist/:artist_id/edit' => 'artists#edit'
  get '/artist/new' => 'artists#add'
  post '/concerts/:concert_id/artists/:id' => 'comments#create'


end
