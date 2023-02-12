class AddBmiToHealthExaminationStandardResults < ActiveRecord::Migration[6.1]
  def change
    add_column :health_examination_standard_results, :bmi, :float
  end
end
