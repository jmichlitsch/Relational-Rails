class Vehicle < ApplicationRecord
  belongs_to :dealership

  def self.does_have_auto_transmission
    self.where("vehicles.auto_transmission = true")
  end

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
