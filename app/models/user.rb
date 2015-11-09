require 'bcrypt'

class User < ActiveRecord::Base
  has_many :finance_entries
  has_many :fitness_entries
  has_many :health_entries
  has_many :menstruation_entries 
  
  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end
