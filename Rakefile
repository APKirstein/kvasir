# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks



# namespace :update do
#   desc "Import market data"
#   task market_update: :environment do


namespace :market do
  desc "Import market"
  task importer: :environment do
    MarketData.db_import
  end

  desc "Update market data"
  task update: :environment do
    MarketData.update_url
  end


end
