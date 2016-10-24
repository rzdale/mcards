Rails.application.routes.draw do

    root 'cards#index'

    get '/cards' => 'cards#index'
    
    get '/cards/:id' => 'cards#show'
    

end

