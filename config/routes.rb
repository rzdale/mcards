Rails.application.routes.draw do

    root 'cards#index'
    
    post '/checkout' => 'cards#checkout'

    get '/cards' => 'cards#index'
    
    get '/cards/:id' => 'cards#show'
    

end

