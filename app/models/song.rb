class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: true if self.find_by(release_year: release_year)
  #validate :title_cannot_be_repeated_in_same_year
  validates :released, format: { with: /true|false/ }
  validates :release_year, presence: true, if: 'released == true'
  validates :release_year, numericality: { less_than_or_equal_to: Date.today.year }, if: 'release_year.present?'
  validates :artist_name, presence: true

  # def title_cannot_be_repeated_in_same_year
  #   title_test = Song.find_by(title: title)
  #   if title.present? && title_test && title_test.release_year == release_year
  #     errors.add(:title, "cannot be repeated by the same artist in the same year")
  #   end
  # end
end
