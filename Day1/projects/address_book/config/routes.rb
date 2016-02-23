Rails.application.routes.draw do

  get '/contacts' => 'contacts#index'

  get '/new' => 'contacts#new'

  post '/contacts', :to => "contacts#create"

  get '/contacts/:id_contact' => 'contacts#show'

  get '/error' => 'contacts#error'

  post '/search' => 'contacts#search'

  get '/favourites' => 'contacts#favourites'

  get '/favourite/:id_contact' => 'contacts#favourite'

end
