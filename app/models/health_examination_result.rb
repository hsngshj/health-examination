class HealthExaminationResult < ApplicationRecord
  belongs_to :user
  validates :examination_file_path, presence: true

  mount_uploader :examination_file_path, ImageUploader
end
