class Pet < ApplicationRecord
  SPECIES = %w[dog cat rabbit snake turtle]

  validates :name, presence: true
  validates :species, inclusion: {
    in: SPECIES
  }

  def since_found
    days = (Date.today - found_on).to_i
    if days == 0
      'today'
    else
      "#{days} days ago"
    end
  end
end
