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
            
        def query_fact_quotes
            Quote.all.each do |quotes|
                #quote_id > Quote > id
                #creation > Quote > created_at
                #company_name > ?????
                #email > ????
                # nbElevator > Quote > elevator_amount
                puts "hello"
            end
            # quotes.each do |row|
            #     row.values_at('')
        end
        def query_fact_contact
            #contact_id > Leads > id
            #creation > Leads > created_at
            #company_name >Leads > email
            #email> Leads > email
            #project_name > Leads>project_name
            self.conn.exec( "SELECT * FROM ")
        end
        def query_fact_elevator
            
            Elevator.all.each do |elevators|
                serialnum =  elevators.serial_number
                columnid = elevators.column_id
                # batteryid = Column.columnid.battery_id
                address = elevators.column.battery.building.address
                puts columnid
                date_of_commissioning = elevators.date_of_commissioning
                puts date_of_commissioning
                self.conn.exec("INSERT into factelevator (serial_number) VALUES (#{serialnum})")
            end
            #    Elevator.find_by_sql("SELECT id, serial_number FROM elevators").all.each do |elevators|
            #     puts 'elevators'
            #    end
            # Elevator.pluck(:serial_number) do |elevators|
            #     # puts elevators
            #     # puts "good"
            #     elevators.each do |row|
            #         # puts row.values_at('serial_number')
            #         # puts "great"
            #         self.conn.exec("INSERT into factelevator (serial_number) VALUES (row)")
            #         # puts elevators
            #     end
            # end
            # Elevator.connection:serial_number.each do |elevators|
            #     puts elevators
            #     puts "wowiebazowie"
            # end
        end
        def query_dim_customers
            Customer.all.each do |customer|
                creationdate =  customer.created_at
                companyname = customer.company_name
                # maincontact = customers.company_contact_full_name
                mainemail = customer.company_contact_email
                #customercity = 
                nbelevators = 5
                puts companyname
                # puts maincontact
                puts mainemail
                puts nbelevators
                self.conn.exec("INSERT into DimCustomers (company_name, creation) VALUES ('#{companyname.gsub("'", "")}', '#{creationdate}')")
            end
            
            # self.conn.exec( "SELECT * FROM DimCustomers" ) do |result|
            #     puts "hello"
            #     #select answers from this table and for each, make one result
            #     # creation = created_at
            #     # company_name = company_name
            #     # full_name_company_contact = company_contact_full_name
            #     # email_company_contact = company_contact_email
            #     # num_of_elevators = num entries in elevators table with user_id
                
            #     result.each do |row|
            #         puts "wow"
            #         #for each result do a row
            #         puts row.values_at('company_name')
            #         #look at the column with value 'company_name' and print those
            #         self.conn.exec("INSERT into DimCustomers (company_name) VALUES ('DOG SHIT')")
            #     end
            # end
        end

        def empty_customer_table
            self.conn.exec("TRUNCATE TABLE dimcustomers")
        end
        def empty_elevator_table
            self.conn.exec("TRUNCATE TABLE factelevator")
        end
                    
        def sync_mysql

            self.sync_mysql_buildings

        end

        def sync_mysql_buildings
            Building.all.each do |building|

                #nb_elvator = self.count_elevator(building)

                puts building
            end
        end

        # def count_elevator(building)
        #     building.batteries
        # end

    end
end
    
