class Tool < ActiveRecord::Base
  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true

  belongs_to :user
  belongs_to :category
  
  def formatted_price
    price / 100.00
  end
end
