class Shop < ApplicationRecord
  has_many :snowboards, dependent: :destroy 
end
