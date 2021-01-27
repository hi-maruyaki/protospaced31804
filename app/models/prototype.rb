class Prototype < ApplicationRecord
  belongs_to :user
  has_many  :comments
  has_one_attached :image

  # validates :content, presence: true, unless: :was_attached?

  validates :title, presence: true
  validates :catch_copy, presence: true
  validates :concept, presence: true
  
  
  def was_attached?
    self.image.attached?
  end
  validates :image, presence: true

end
