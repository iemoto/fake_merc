class Image < ApplicationRecord
  belongs_to :item_id

  validates :item_id, :image_url, presence: true
end
