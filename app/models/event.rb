class Event < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  has_many :relationships
  has_many :event_owner, through: :relationships, source: :user 


  
  validates :name, presence: true, length: { maximum: 20 }
  validates :place, presence: true, length: { maximum: 20 }
  validates :date, presence: true
  validates :hour, presence: true 
  validates :minimum_people, presence: true
  validates :material, presence: true 
  validates :comment, presence: true
  
end
