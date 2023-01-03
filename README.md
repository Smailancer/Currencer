# Currency Converter

Currency Converter is a web application that allows you to convert between different currencies.

## Features

* Convert between more than 49 currencies
* Get hourly exchange rates from a reliable source
* Choose from multiple conversion methods
* Save and view your conversion history

## Installation

To install Currency Converter, follow these steps:

1. Clone the repository:

```
git clone https://github.com/Smailancer/currencer.git
```

2. Install the dependencies:
```
bundle install
```
3. Set up the database:
```
rails db:create
rails db:migrate
```
## Configuration

Currency Converter can be configured using the following environment variables:

* `CURRENCY_CONVERTER_API_KEY`: The API key to use when making API requests to the currency exchange rate provider.

## Usage

To use Currency Converter, visit the homepage at 
```
http://localhost:3000.
```