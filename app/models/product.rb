class Product < ApplicationRecord

	belongs_to :user
	mount_uploader :image, ImageUploader

	acts_as_taggable_on :tags
	acts_as_ordered_taggable_on :interests
	default_scope -> { order(created_at: :desc) }
	# validates :title, :body, presence: true
	validate :add_error_sample

	def add_error_sample
		if name.blank?
			errors[:base] << "商品名を記入してください"
		end
		if price.blank?
			errors[:base] << "商品の値段を記入してください"
		end
		if description.blank?
			errors[:base] << "商品の説明を記入してください"
		end
		
	end

end
