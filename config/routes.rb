Rails.application.routes.draw do

    root 'cards#index'
    
    get '/checkout' => 'cards#checkout'
    
    post '/process_payment' => 'cards#process_payment'

    get '/cards' => 'cards#index'
    
    get '/cards/:id' => 'cards#show'
    

end

