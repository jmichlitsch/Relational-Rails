class Dealership < ApplicationRecord
  has_many :vehicles, dependent: :destroy

  def child_count
    vehicles.count
  end

  def self.sort_by_children(child)
    if !child.nil?
      all = Dealership.all
      all.sort_by{|dealership| dealership.child_count}.reverse
    # order(self.child_count :desc)
    else
      self.all
    end
  end
end
