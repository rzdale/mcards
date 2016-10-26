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
        
        @price = @card.price
        
    end
    
    
    def checkout
        @card = Card.find(params[:id])
        @price = @card.price        
        @token = Braintree::ClientToken.generate
    end
    

    def process_payment
        result = Braintree::Transaction.sale(
                amount: params[:price],
                payment_method_nonce: params[:payment_method_nonce],
                options: {submit_for_settlement: true}
            )
            
        new_order = Order.new(
            card_id: params[:card_id],
            address_line_2: params[:address_line_2],
            address_line_1: params[:address_line_1],
            city: params[:city],
            state_abbr: params[:state_abbr],
            zip_code: params[:zip_code]
            )
        
        if new_order.save
            redirect_to root_path
        else
            @error = new_order.errors.full_messages
        end
    end

end
