class PlantLabel < ApplicationRecord
  belongs_to :plant
  belongs_to :label

  validates :plant, presence: true
  validates :label, presence: true
  validates :label, uniqueness: { scope: :plant }
end
