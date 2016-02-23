Rails.application.routes.draw do

get '/most_visited_pages' => 'link#index'

get '/:shortlink' => 'link#show'

end
