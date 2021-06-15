class Book < ApplicationRecord
  has_one_attached :image

  validates :title, presence: true
  validates :author, presence: true

  def image?
    image.attached?
  end

end
