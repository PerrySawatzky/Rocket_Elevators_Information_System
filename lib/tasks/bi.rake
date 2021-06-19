require('lib/BI/sync')

namespace :bi do
  desc "TODO"
  task sync_mysql_to_postgres: :environment do
    BI::Sync.new().sync_mysql
    BI::Sync.new().inject_factcontact
    BI::Sync.new().inject_factquotes
    BI::Sync.new().inject_factelevator
    BI::Sync.new().inject_dimcustomers
    BI::Sync.new().empty_factquotes
    BI::Sync.new().empty_factcontact
    BI::Sync.new().empty_factelevator
    BI::Sync.new().empty_dimcustomers
  end

end
