class Driver < ActiveRecord::Base
  has_many :receipts
  has_many :riders, through: :receipts
end
