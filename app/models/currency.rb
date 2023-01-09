class Currency < ApplicationRecord
    validates :symbol, presence: true
end
