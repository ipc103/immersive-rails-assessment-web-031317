class Guest < ApplicationRecord
  has_many :appearances
  has_many :episodes, through: :appearances

  def self.top_guests
    joins(:appearances).group('guests.id').order('AVG(rating) DESC')
  end

  def average_rating
    appearances.average(:rating).to_f
  end
end
