class Requisition < ActiveRecord::Base
  belongs_to :borrower
  belongs_to :reason
  belongs_to :category
  validates :req_id, :presence=>true, :uniqueness=>true, :format=>{:with=>/\d{11}/}
  validates_presence_of :account_name
  
  #kaminari
  paginates_per 20
  
  default_scope :order=>'req_id ASC'
  scope :in_stock, where(:is_borrowed=>false)
 
  
  
end
