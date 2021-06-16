class Customer < ApplicationRecord
    has_many :buildings
    has_one :user
end
