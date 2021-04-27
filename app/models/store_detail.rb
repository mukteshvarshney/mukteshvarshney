class StoreDetail < ApplicationRecord
	has_many :store_ratings
	#has_one_attached :image, :dependent => :destroy
	has_many_attached :image
end
