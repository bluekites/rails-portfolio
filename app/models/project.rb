class Project < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  
  validates :title, :description, presence: :true
  def self.created_descending
    all.order("created_at desc") 
  end
end
