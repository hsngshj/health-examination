class HealthExaminationResult < ApplicationRecord
  belongs_to :user
  
  validates :examination_file_path, presence: true
  validates :examination_date, presence: true, if: :day_before_today?
  validates :height, allow_nil: true, numericality: { greater_than: 0 }
  validates :weight, allow_nil: true, numericality: { greater_than: 0 }
  validates :ldl_cholesterol, allow_nil: true, numericality: { greater_than: 0 }
  validates :fpg, allow_nil: true, numericality: { greater_than: 0 }
  validates :gamma_gtp, allow_nil: true, numericality: { greater_than: 0 }
  validates :uric_acid, allow_nil: true, numericality: { greater_than: 0 }
  
  def day_before_today?
    if !!examination_date
      if examination_date <= Date.today
        return true
      else
        errors.add(:examination_date, "本日以前の日付を入力してください。")
      end
    end
  end

  mount_uploader :examination_file_path, ImageUploader
end
