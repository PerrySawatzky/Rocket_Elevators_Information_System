class Address < ApplicationRecord
    belongs_to :building, optional: true
end
