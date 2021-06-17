class Building < ApplicationRecord
    has_many :batteries
    has_one :building_details
    belongs_to :customer
    has_one :address
    #belongs_to :address
end
