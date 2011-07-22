class Requisition < ActiveRecord::Base
  belongs_to :user
  belongs_to :reason
  belongs_to :category
end
