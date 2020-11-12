class Plant < ApplicationRecord
  belongs_to :garden

  validates :name, presence: true, uniqueness: { scope: :garden }
  validates :image_url, presence: true
  validates :garden, presence: true
  
end
