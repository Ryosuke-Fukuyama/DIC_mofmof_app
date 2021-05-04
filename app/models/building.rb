class Building < ApplicationRecord
  has_many :stations

  accepts_nested_attributes_for :stations, allow_destroy: true

  validates :name, presence: true
  validates :price, presence: true
  validates :address, presence: true
  validates :old, presence: true
end
