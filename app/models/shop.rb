class Shop < ApplicationRecord
  has_many :snowboards, dependent: :destroy

  def child_count
    snowboards.count
  end

  def self.sort_by_children(child)
    if !child.nil?
      all = Shop.all
      all.sort_by{|shop| shop.child_count}.reverse
    # order(self.child_count :desc)
    else
      self.all
    end
  end
end
