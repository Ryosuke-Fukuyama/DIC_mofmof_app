class Building < ApplicationRecord
  has_many :stations

  accepts_nested_attributes_for :stations

  validates :name, presence: true
end
