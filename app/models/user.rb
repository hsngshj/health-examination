class User < ApplicationRecord
validates :name, presence: true, length: { maximum: 50 }
validates :gender, presence: true
validates :birth_date, presence: true, if: :day_before_today?
validates :email, presence: true, length: { maximum: 255 },
                format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                uniqueness: { case_sensitive: false }

  def day_before_today?
    if !!birth_date
      if birth_date <= Date.today
        return true
      else
        errors.add(:birth_date, "本日以前の日付を入力してください。")
      end
    end
  end

    has_secure_password
    has_many :health_examination_results, dependent: :destroy
end
