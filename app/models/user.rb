class User < ActiveRecord::Base
  has_many :requisitions
end
