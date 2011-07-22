class Borrower < ActiveRecord::Base
  has_many :requisitions  
end
