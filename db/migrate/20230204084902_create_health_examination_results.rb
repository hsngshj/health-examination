class CreateHealthExaminationResults < ActiveRecord::Migration[6.1]
  def change
    create_table :health_examination_results do |t|
      t.float :height
      t.float :weight
      t.float :ldl_cholesterol
      t.float :fpg
      t.float :gamma_gtp
      t.float :uric_acid
      t.date :examination_date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
