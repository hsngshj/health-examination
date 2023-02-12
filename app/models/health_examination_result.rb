class HealthExaminationResult < ApplicationRecord
  belongs_to :user
  
  mount_uploader :examination_file_path, ImageUploader
end
