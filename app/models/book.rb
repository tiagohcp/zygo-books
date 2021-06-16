class Book < ApplicationRecord
  has_one_attached :image

  validates :title, presence: true
  validates :author, presence: true
  validates :image, presence: true, blob: { content_type: ['image/jpg', 'image/jpeg', 'image/png'], size_range: 0..1.megabytes }

  def image?
    image.attached?
  end

end
