namespace :archive do
  desc "Export item table to history"
  task :exporter => :environment do
    Exporter.import
    Exporter.remake
  end
end
