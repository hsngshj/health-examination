class RemoveWeightFromHealthExaminationStandardResults < ActiveRecord::Migration[6.1]
  def change
    remove_column :health_examination_standard_results, :weight, :float
  end
end
