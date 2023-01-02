Sidekiq::Cron::Job.create(name: 'Currency updater - every hour', cron: '0 * * * *', klass: 'CurrencyUpdaterWorker')
