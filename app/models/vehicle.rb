class Vehicle < ApplicationRecord
  belongs_to :dealership

  def self.limit_passengers(limit)
    if !limit.nil?
      where('passenger_limit > ?', limit)
    else
      self.all
    end
  end

  def self.alphabetize(alpha)
    if !alpha.nil?
      order(:name)
    else
      self.all
    end
  end

end
