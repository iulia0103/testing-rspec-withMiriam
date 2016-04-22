class Product < ActiveRecord::Base
  validates :name, :description, presence: true

  def bargain?
    price < 5
  end
end
