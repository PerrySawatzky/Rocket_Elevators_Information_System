require 'BI/sync'

namespace :bi do
  desc "TODO"
  task sync_mysql_to_postgres: :environment do
    BI::Sync.new().sync_mysql
  end
  task inject_factcontact: :environment do
    BI::Sync.new().inject_factcontact
  end
  task inject_factquotes: :environment do
    BI::Sync.new().inject_factquotes
  end
  task inject_factelevator: :environment do
    BI::Sync.new().inject_factelevator
  end
  task inject_dimcustomers: :environment do
    BI::Sync.new().inject_dimcustomers
  end
  task empty_factquotes: :environment do
    BI::Sync.new().empty_factquotes
  end
  task empty_factcontact: :environment do
    BI::Sync.new().empty_factcontact
  end
  task empty_factelevator: :environment do
    BI::Sync.new().empty_factelevator
  end
  task empty_dimcustomers: :environment do
    BI::Sync.new().empty_dimcustomers
  end

end
