class CardsController < ApplicationController

    require "braintree"

    Braintree::Configuration.environment = :sandbox
    Braintree::Configuration.merchant_id = ENV['MERCHANT_ID']
    Braintree::Configuration.public_key = ENV['PUBLIC_KEY']
    Braintree::Configuration.private_key = ENV['PRIVATE_KEY']


    def index
        @cards = Card.all
    end


    def show
        @card = Card.find(params[:id])
        
        @mana_img = case @card.color
           when "White" then "mana/White_Mana.png"
           when "Black" then "mana/Black_Mana.png"
           when "Blue" then "mana/Blue_Mana.png"
           when "Green" then "mana/Green_Mana.png"
           when "Red" then "mana/Red_Mana.png"
        end
        
        @price = case @card.rarity
            when 1 then 1.0
            when 2 then 5.0
            when 3 then 10.0
        end
        
        @token = Braintree::ClientToken.generate
        
    end

    def checkout
        result = Braintree::Transaction.sale(
                amount: params[:price],
                payment_method_nonce: params[:payment_method_nonce],
                options: {submit_for_settlement: true}
            )
    end

end
