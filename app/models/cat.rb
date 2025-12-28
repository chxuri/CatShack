class Cat < ApplicationRecord
  validates :name, presence: true
  validate :photo_must_be_attached
  belongs_to :user
  has_one_attached :photo

  private
  def photo_must_be_attached
    errors.add(:photo, "must be attached") unless photo.attached?
  end
end
