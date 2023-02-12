class User < ApplicationRecord
    validates :name, presence: true, length: { maximum: 50 }
    validates :gender, presence: true
    validates :birth_date, presence: true
    validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
    
    has_secure_password
    has_many :health_examination_results, dependent: :destroy
end
