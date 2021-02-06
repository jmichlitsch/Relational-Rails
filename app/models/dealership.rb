class Dealership < ApplicationRecord
  has_many :vehicles, dependent: :destroy 
end
