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
            
        def inject_factquotes
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
        def inject_factcontact
            Lead.all.each do |lead|
                contact_id = lead.id
                creation = lead.created_at
                company_name = lead.company_name 
                email = lead.email 
                project_name = lead.project_name
                self.conn.exec("INSERT into factcontact (contact_id, creation, company_name, email, project_name) VALUES ('#{contact_id}', '#{creation}', '#{company_name.gsub("'", "")}', '#{email}', '#{project_name}')")
            end
        end
        def inject_factelevator
            Elevator.all.each do |elevator|
                date_of_commissioning = elevator.date_of_commissioning
                building_id = elevator.column.battery.building.id
                customer_id = elevator .column.battery.building.customer.id
                building_city = elevator.column.battery.building.address.city
                serial_number =  elevator.serial_number
                self.conn.exec("INSERT into factelevator (date_of_commissioning, building_id, customer_id, building_city, serial_number) VALUES ('#{date_of_commissioning}','#{building_id}', '#{customer_id}', '#{building_city.gsub("'", "")}', '#{serial_number}')")
            end
        end
        def query_dimcustomers
            Customer.all.each do |customer|
                creation_date =  customer.created_at
                company_name = customer.company_name
                main_contact = customer.company_contact_full_name
                main_email = customer.company_contact_email
                nbelevators = 5
                customer_city = customer.user.
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

        def empty_factcontact
            self.conn.exec("TRUNCATE TABLE factcontact")
        end
        def empty_dimcustomers
            self.conn.exec("TRUNCATE TABLE dimcustomers")
        end
        def empty_factelevator
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
    
