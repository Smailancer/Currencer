class Currency < ApplicationRecord
    validates :symbol, presence: true

    def current_price
        url = 'https://api.frankfurter.app/latest?from='
        request = HTTParty.get(url + self.symbol)
        response = JSON.parse(request.body)
    end

    def calculate(to, amount )
        current_price.find(to)
        value = response.find(to)
        return value * amount
    end

end
