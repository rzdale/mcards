class CardsController < ApplicationController

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
        
        
        
    end

end
