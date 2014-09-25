
require 'digest/sha1'
class User < ActiveRecord::Base
  attr_accessible  :email, :name,:hash_password,:password ,:confirm_password,:admin_user

  attr_accessor :password ,:confirm_password

   before_save :encrypt_password
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :password 
  validates_confirmation_of :password

  #def self.hash(password="")
  	#Digest::SHA1.hexdigest(password)
  #end

  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.hash_password == Digest::SHA1.hexdigest(password)
      user
    else
      nil
    end
  end 

 def encrypt_password
    if password.present?
      #self.password_salt = BCrypt::Engine.generate_salt
      self.hash_password = Digest::SHA1.hexdigest(password)
    end
  end


end
