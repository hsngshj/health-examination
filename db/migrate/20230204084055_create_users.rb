class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :gender
      t.date :birth_date
      t.string :password_digest

      t.timestamps
    end
  end
end
