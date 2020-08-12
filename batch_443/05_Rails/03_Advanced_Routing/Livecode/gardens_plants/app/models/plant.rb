class Plant < ApplicationRecord
  belongs_to :garden

  validates :name, :picture_url, :garden, presence: :true
  validates :name, uniqueness: :true
end
