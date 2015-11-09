class CreateMenstruationEntries < ActiveRecord::Migration
  def change
    create_table :menstruation_entries do |t|
      t.date :start_date
      t.date :end_date
      t.text :notes
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
