class CurrencyUpdaterJob
  include Sidekiq::Job

  def perform(*args)
    
    Currency.all.each do |currency|
      symbol = currency.symbol
      value = fetch_currency_value(symbol)
      currency.update(value: value)
    end
    
  end
end
