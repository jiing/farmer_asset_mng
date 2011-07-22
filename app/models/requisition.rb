class Requisition < ActiveRecord::Base
  belongs_to :borrower
  belongs_to :reason
  belongs_to :category
end
