class Prototype < ApplicationRecord
  belongs_to :user
  has_many  :comments
  has_one_attached :image

  validates :content, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end
end
