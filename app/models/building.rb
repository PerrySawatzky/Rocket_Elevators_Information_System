class Building < ApplicationRecord
    has_many :batteries
    has_many :building_details
    belongs_to :customer
    has_one :address
end
