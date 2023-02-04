class User < ApplicationRecord
    has_secure_password
    has_many :health_examination_results
end
