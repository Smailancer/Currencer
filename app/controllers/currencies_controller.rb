class CurrenciesController < ApplicationController
  before_action :current_price
  
  
  def index
    @currency = Currency.new
    @currencies = Currency.all.pluck(:symbol, :id)
    
    # @response = @response["rates"]["EUR"]

    # @response = @response["rates"].each do |data| 
    #   if @response["rates"][] == Currency.find_by(symbol: )
    #   Currency.create(
    #     value: data['rates']['text'],

    #   )
    #   end
    # end
  end


  def convert
    value = params[:value]
    from = params[:from_currency]
    to = params[:to_currency]


    puts @value , @from , @to

  end


  private 

  
  def current_price
    url = 'https://api.frankfurter.app/latest?from='
    request = HTTParty.get(url + "USD")
    @response = JSON.parse(request.body)
  end

end
