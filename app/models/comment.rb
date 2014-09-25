class Comment < ActiveRecord::Base
  attr_accessible :comment, :email, :name
  belongs_to :article
  validates_presence_of :name
  #validate :title presence :true , allow_blank :false
  validates_length_of :comment ,:minimum => 5 
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
end
