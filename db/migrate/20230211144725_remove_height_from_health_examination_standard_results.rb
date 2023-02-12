class RemoveHeightFromHealthExaminationStandardResults < ActiveRecord::Migration[6.1]
  def change
    remove_column :health_examination_standard_results, :height, :float
  end
end
