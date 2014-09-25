class Article < ActiveRecord::Base

  attr_accessible :description, :title
  validates_presence_of :title
  #validate :title presence :true , allow_blank :false
  validates_length_of :description ,:minimum =>10 
  has_many :comments
end

