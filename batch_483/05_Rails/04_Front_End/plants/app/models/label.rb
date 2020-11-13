class Label < ApplicationRecord
  has_many :plant_labels
  has_many :plants, through: :plant_labels 
end
