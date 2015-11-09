class FinanceEntry < ActiveRecord::Base
  belongs_to :user

  def self.search(search)
    where("notes ILIKE ? or category ILIKE ?", "%#{search}%", "%#{search}%")
  end

end
