class Post < ApplicationRecord

	belongs_to :user
	mount_uploader :image, ImageUploader

	acts_as_taggable_on :tags
	acts_as_ordered_taggable_on :interests

end
