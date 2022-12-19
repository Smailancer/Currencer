class Currency < ApplicationRecord

    def current_price
        url = 'https://api.frankfurter.app/latest?from='
        request = HTTParty.get(url + self.symbol)
        response = JSON.parse(request.body)
    end

    def calculate(response ,to, amount )

        value = response.find(to)
        return value * amount
    end

end
