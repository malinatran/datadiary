class CreateHealthEntries < ActiveRecord::Migration
  def change
    create_table :health_entries do |t|
      t.date :date
      t.string :emotion
      t.text :notes
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
