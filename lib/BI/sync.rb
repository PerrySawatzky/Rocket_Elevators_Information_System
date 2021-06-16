require 'pg'

module BI
    class Sync
        #init varable such as my_tool using BI::Sync.new "my_tool = BI::Sync.new"
        attr_accessor :conn
        #conn attribute connects us to the proper database, update these values when deploying
        def initialize
            conn = PG::Connection.new( 
                :host => "127.0.0.1", 
                :port => 5432, 
                :dbname => 'rocket_elevators_postgres', 
                :user => 'officeimac', 
                :password => '' )
                self.conn = conn
        end

        def query_dim_customers
            self.conn.exec( "SELECT * FROM DimCustomers" ) do |result|
                #select answers from this table and for each, make one result
                result.each do |row|
                    #for each result do a row
                    puts row.values_at('company_name')
                    #look at the column with value 'company_name' and print those
                    #INSERT into DimCustomers (company_name) VALUES ('PARROT INC')
                end
              end
        end
        def query_customer 
        
        # customers in postrgres vs customers in mysql
        # creation = created_at
        # ompany_name = company_name
        # full_name_company_contact = company_contact_full_name
        # email_company_contact = company_contact_email
        # num_of_elevators = num entries in elevators table with user_id
        
        #factscontact in posgres vs 
        #
        #
        #              
        def sync_mysql

            self.sync_mysql_buildings

        end

        def sync_mysql_buildings
            Building.all.each do |building|
                puts building
            end
        end

    end
end
    
