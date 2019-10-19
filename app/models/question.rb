class Question < ApplicationRecord
  belongs_to :user
  
  validates :content, presence:true
  validates :email, presence:true, length: { maximum: 255 },
                     format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                     uniqueness: { case_sensitive: false }
end
