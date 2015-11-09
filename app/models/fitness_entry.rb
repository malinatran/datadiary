class FitnessEntry < ActiveRecord::Base
  belongs_to :user

  def self.search(search)
    where("notes ILIKE ?", "%#{search}%")
  end
  
end
