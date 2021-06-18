require 'pg'

module BI
    class Sync
        #deploy
        #configre application.yml on server

        #init varable such as my_tool using BI::Sync.new "my_tool = BI::Sync.new"
        attr_accessor :conn
        #conn attribute connects us to the proper database, update these values when deploying
        def initialize
            conn = PG::Connection.new( 
                :host => ENV['PG_HOST'], 
                :port => 5432, 
                :dbname => ENV['DBNAME'], 
                :user => ENV['PG_USER'],
                :password => ENV['PASSWORD'] )
                self.conn = conn
            end
            
        def inject_factquotes
            Quote.all.each do |quote|
                quote_id = quote.id
                creation = quote.created_at
                company_name = quote.company_name
                email = quote.email 
                num_of_elevators = quote.elevator_amount
                self.conn.exec("INSERT into factquotes (
                quote_id, 
                creation, 
                company_name, 
                email, 
                num_of_elevators) VALUES (
                '#{quote_id}', 
                '#{creation}', 
                '#{company_name.gsub("'", "")}', 
                '#{email}', 
                '#{num_of_elevators}')")
            end
        end
        def inject_factcontact
            Lead.all.each do |lead|
                contact_id = lead.id
                creation = lead.created_at
                company_name = lead.company_name 
                email = lead.email 
                project_name = lead.project_name
                self.conn.exec("INSERT into factcontact (
                contact_id, 
                creation, 
                company_name, 
                email, 
                project_name) VALUES (
                '#{contact_id}', 
                '#{creation}', 
                '#{company_name.gsub("'", "")}', 
                '#{email}', 
                '#{project_name.gsub("'", "")}')")
            end
        end
        def inject_factelevator
            Elevator.all.each do |elevator|
                date_of_commissioning = elevator.date_of_commissioning
                building_id = elevator.column.battery.building_id
                customer_id = elevator.column.battery.building.customer.id
                building_city = elevator.column.battery.building.address.city
                serial_number =  elevator.serial_number
                self.conn.exec("INSERT into factelevator (
                date_of_commissioning, 
                building_id, 
                customer_id, 
                building_city, 
                serial_number) VALUES (
                '#{date_of_commissioning}',
                '#{building_id}', 
                '#{customer_id}', 
                '#{building_city.gsub("'", "")}', 
                '#{serial_number}')")
            end
        end
        def inject_dimcustomers
            Customer.all.each do |customer|
                creation =  customer.created_at
                company_name = customer.company_name
                full_name_company_contact = customer.company_contact_full_name
                email_company_contact = customer.company_contact_email
                num_of_elevators = 0
                Elevator.all.each do |elevator|
                    if elevator.column.battery.building.customer.id == customer.id
                        num_of_elevators += 1
                    end
                end
                customer_city = customer.headquarters_address
                self.conn.exec("INSERT into DimCustomers (
                creation, 
                company_name, 
                full_name_company_contact, 
                email_company_contact, 
                num_of_elevators, 
                customer_city) VALUES (
                '#{creation}', 
                '#{company_name.gsub("'", "")}', 
                '#{full_name_company_contact.gsub("'", "")}', 
                '#{email_company_contact}', 
                '#{num_of_elevators}', 
                '#{customer_city.gsub("'", "")}')")
            end
        end
        def empty_factquotes
            self.conn.exec("TRUNCATE TABLE factquotes")
        end
        def empty_factcontact
            self.conn.exec("TRUNCATE TABLE factcontact")
        end
        def empty_factelevator
            self.conn.exec("TRUNCATE TABLE factelevator")
        end
        def empty_dimcustomers
            self.conn.exec("TRUNCATE TABLE dimcustomers")
        end
                    
        def sync_mysql

            puts "TEST"
            #self.sync_mysql_buildings

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
    
