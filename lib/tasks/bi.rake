require("bi/sync")

namespace :bi do
  desc "TODO"
  task sync_mysql_to_postgres: :environment do
    BI::Sync.new().sync_mysql
    BI::Sync.new().sync_mysql
  end

end
