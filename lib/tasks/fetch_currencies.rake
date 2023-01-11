desc "Fetch currencies"
task fetch_currencies: :environment do
  require 'httparty'
  require 'json'
  
  CurrenciesController.new.update_values
end
