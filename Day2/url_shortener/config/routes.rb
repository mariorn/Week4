Rails.application.routes.draw do

get '/' => 'link#home'

get '/most_visited_pages' => 'link#index'

get '/:shortlink' => 'link#show'

post '/add' => 'link#add'

end
