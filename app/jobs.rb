class CurrencyUpdater
    @queue = :currency_updates
  
    def self.perform
        
      # Calling the update_values method here
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


    end
  end
  