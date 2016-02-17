class Post < ActiveRecord::Base
  
  validates :title, :content, presence: :true
  
  def self.created_descending
    all.order("created_at desc") 
  end
end
