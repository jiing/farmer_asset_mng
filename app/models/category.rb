class Category < ActiveRecord::Base
  has_many :requisitions
  validates_presence_of :name
end
