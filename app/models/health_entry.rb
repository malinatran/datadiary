class HealthEntry < ActiveRecord::Base
  belongs_to :user

  def self.search(search)
    where("notes ILIKE ? or emotion ILIKE ?", "%#{search}%", "%#{search}%")
  end
  
end
