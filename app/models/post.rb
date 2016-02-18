class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  validates :title, :content, presence: :true
  
  def self.created_descending
    all.order("created_at desc") 
  end
end
