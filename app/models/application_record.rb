class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.recent_created_by
    order(id: :desc)
  end
end
