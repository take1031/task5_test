class Post < ApplicationRecord

	belongs_to :user
	mount_uploader :image, ImageUploader

	acts_as_taggable_on :tags
	acts_as_ordered_taggable_on :interests
	default_scope -> { order(created_at: :desc) }
	# validates :title, :body, presence: true
	validate :add_error_sample

	def add_error_sample
		if title.blank?
			errors[:base] << "タイトルを記入してください"
		end
		if body.blank?
			errors[:base] << "内容を記入してください"
		end
		
	end

end
