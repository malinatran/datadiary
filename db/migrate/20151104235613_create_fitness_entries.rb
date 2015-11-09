class CreateFitnessEntries < ActiveRecord::Migration
  def change
    create_table :fitness_entries do |t|
      t.date :date
      t.integer :duration
      t.text :notes
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
