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
    @currencies = Currency.all.pluck(:symbol, :id)

    @value = params[:value]
    @from_currency = Currency.find(params[:from_currency])
    @to_currency = Currency.find(params[:to_currency])
    # @result = value * from_currency.value / to_currency.value
    
    # @result = result

  end


  private 

  
  def current_price
    url = 'https://api.frankfurter.app/latest?from='
    request = HTTParty.get(url + "USD")
    @response = JSON.parse(request.body)
  end

end
