class Reason < ActiveRecord::Base
  has_many :requisitions
  validates_presence_of :content
end
