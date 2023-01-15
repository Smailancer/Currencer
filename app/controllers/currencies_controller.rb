class CurrenciesController < ApplicationController
  before_action :current_price
  
  
  def index
    @currencies = Currency.all.pluck(:symbol, :id)
    
    # Bring the last updated_at value from the data base
    @date = Currency.maximum(:updated_at)

  end

#The Method that does the updates
  def update_values

    # Extract the rates data from the response
    rates = current_price["rates"]
  
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
  
  

# The Method That do the conversion
  def convert
    value = params[:value].to_i
    from_currency = Currency.find(params[:from_currency])
    to_currency = Currency.find(params[:to_currency])
    conversion_result = value * to_currency.value / from_currency.value
  
    flash[:success] = "The conversion result is #{conversion_result} #{to_currency.symbol}"
    redirect_to root_path
  end


  private 

  
#Api call
  def current_price
    url = "https://api.apilayer.com/exchangerates_data/latest"
    headers = {"apikey" => "HKDdFHJX9BgO2HV95cnptUqz8s3e3WC7"}
    params = {"base" => "USD"}
    
    response = HTTParty.get(url, headers: headers, query: params)
    response = JSON.parse(response.body)
    
  end

end
