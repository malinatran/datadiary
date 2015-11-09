class AddCategoryTypeToFinanceEntries < ActiveRecord::Migration
  def change
    add_column :finance_entries, :category, :string
  end
end
