class AddExaminaitionFilePathToHealthExaminationResults < ActiveRecord::Migration[6.1]
  def change
    add_column :health_examination_results, :examination_file_path, :string
  end
end
