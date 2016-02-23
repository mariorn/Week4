Rails.application.routes.draw do

  get '/contacts' => 'contacts#index'

  get '/new' => 'contacts#new'

  post '/contacts', :to => "contacts#create"

  get '/show/:id_contact' => 'contacts#show'

  get '/error' => 'contacts#error'

  get '/favourite/:id_contact' => 'contacts#favourite'

  post '/search' => 'contacts#search'
end
