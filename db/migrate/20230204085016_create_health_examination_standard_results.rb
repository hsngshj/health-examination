class CreateHealthExaminationStandardResults < ActiveRecord::Migration[6.1]
  def change
    create_table :health_examination_standard_results do |t|
      t.integer :age
      t.string :gender
      t.float :height
      t.float :weight
      t.float :ldl_cholesterol
      t.float :fpg
      t.float :gamma_gtp
      t.float :uric_acid

      t.timestamps
    end
  end
end
