class CreateFinanceEntries < ActiveRecord::Migration
  def change
    create_table :finance_entries do |t|
      t.date :date
      t.integer :expense
      t.text :notes
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
