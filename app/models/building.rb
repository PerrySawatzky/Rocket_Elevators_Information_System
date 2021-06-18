class Building < ApplicationRecord
    has_many :batteries
    has_many :building_details
    belongs_to :customer
    belongs_to :address
end
