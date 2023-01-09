class CurrenciesController < ApplicationController
  before_action :current_price
  
  
  def index
    @currencies = Currency.all.pluck(:symbol, :id)
    
    data = current_price
  
    # Extract the rates data from the response
    @rates = data["rates"]

  end


  def update_values
    # Call the current_price method to get the latest data from the API
    data = current_price
  
    # Extract the rates data from the response
    rates = data["rates"]
  
    # Iterate through the rates and update the value for each currency in the currencies table
    rates.each do |symb, val|
      currency = Currency.find_by(symbol: symb)
      if currency
        currency.update(value: val)
      else
        # Symbol does not exist in the database, skip to the next iteration
        next
      end
    end

        # Set the success variable to true
      success = true
      
      # Redirect the user back to the index page with a notice message if the update was successful, or an alert message if the update failed
      if success
        flash[:primary] = "Values updated"
      else
        flash[:danger] = "Update failed"
      end
    
      # Redirect to the index page
      redirect_to root_path
      
  end
  
  


  def convert
    currencies = Currency.all.pluck(:symbol, :id)

    value = params[:value].to_i
    from_currency = Currency.find(params[:from_currency])
    to_currency = Currency.find(params[:to_currency])
    conversion_result = value * from_currency.value / to_currency.value
  
    flash[:success] = "The conversion result is #{conversion_result}"
    redirect_to root_path
  end
  


  private 

  
  def current_price
    url = 'https://api.frankfurter.app/latest?from='
    request = HTTParty.get(url + "USD")
    @response = JSON.parse(request.body)
  end

end
