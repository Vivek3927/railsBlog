class Article < ApplicationRecord
	# mount_uploader :cover_image, ImageUploader

	has_one_attached :logo
	has_many :comments, dependent: :destroy
	validates :title, presence: true
	validates :body, presence: true, length: { minimum: 10 }
end
