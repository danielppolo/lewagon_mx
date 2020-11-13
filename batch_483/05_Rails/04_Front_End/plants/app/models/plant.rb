class Plant < ApplicationRecord
  belongs_to :garden
  has_many :plant_labels
  has_many :labels, through: :plant_labels 

  validates :name, :image_url, presence: true
end
