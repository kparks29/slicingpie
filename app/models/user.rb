require 'bcrypt'
class User < ActiveRecord::Base
  before_save :hash_the_password
  attr_accessor :password, :confirmed_password
  has_many :company_users
  has_many :companies, through: :company_users
  has_many :grunts

  


  def authenticated?(pwd)
    self.hashed_password == BCrypt::Engine.hash_secret(pwd, self.salt)
  end

  private

  def hash_the_password
    self.salt = BCrypt::Engine.generate_salt
    self.hashed_password = BCrypt::Engine.hash_secret(self.password, self.salt)
    @password = nil
  end
end
