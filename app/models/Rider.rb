class Rider < ActiveRecord::Base
  has_many :receipts
  has_many :drivers, through: :receipts
end
