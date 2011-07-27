class Requisition < ActiveRecord::Base
  belongs_to :borrower
  delegate :name, :to => :borrower, :prefix=> true
  belongs_to :reason
  delegate :content, :to=> :reason, :prefix=> true
  belongs_to :category
  delegate :name, :to=> :category, :prefix=> true
  validates :req_id, :presence=>true, :uniqueness=>true, :format=>{:with=>/^\d{11}$/}, :length=>{:maximum=>11, :minimum=>11}
  validates_presence_of :account_name

  #kaminari
  paginates_per 10

  default_scope :order=>'req_id ASC'
  scope :in_stock, lambda{
      where("requisitions.is_borrowed = ? AND requisitions.reason_id > ?" ,false, 1)
     }
  scope :not_in_stock, lambda{
     where("requisitions.is_borrowed = ? AND requisitions.reason_id >?", true, 1)
  }
  scope :money_returned, lambda{
      where("requisitions.category_id = ? AND requisitions.reason_id > ?",1, 1)
    }
  scope :money_not_returned, lambda{
    where("requisitions.category_id = ? AND requisitions.reason_id > ?", 2, 1)
  }

  scope :mark_as_cleared, where(:reason_id=> 1)
  scope :mark_as_not_cleared, lambda{
    where("requisitions.reason_id > ?", 1)
  }

end
