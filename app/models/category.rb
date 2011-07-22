class Category < ActiveRecord::Base
  has_many :requisitions
end
