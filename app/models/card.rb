class Card < ActiveRecord::Base

    def price
        price = case self.rarity
            when 1 then 1.0
            when 2 then 5.0
            when 3 then 10.0
        end
        price
    end
end
