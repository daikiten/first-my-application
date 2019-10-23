class User < ApplicationRecord
   mount_uploader :photo, PhotoUploader
   before_save { self.email.downcase! }
   validates :name, presence: true, length: { maximum: 50 }
   validates :gender, presence: true, inclusion: { in: ["男","女"]}
   validates :birthdate, presence: true
   validates :phone_number, presence: true, length: { maximum: 11 }
   validates :email, presence: true, length: { maximum: 255 },
                     format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                     uniqueness: { case_sensitive: false }
   
   has_secure_password
   
   has_many :events
   has_many :questions
   has_many :relationships
   has_many :joining_events, through: :relationships, source: :event
   
   
   
   #2019/10/1のメンタリングを終えて多対多の説明。
#   まず、has_many :relationships とすることで,userテーブルとrelationshipsテーブルで１対多の関係を結んでいる。
 ## joining_eventsはメソッド。だから何でもいい。aでもbでも。
end
