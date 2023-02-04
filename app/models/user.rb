class User < ApplicationRecord
    has_many :health_examination_results
end
