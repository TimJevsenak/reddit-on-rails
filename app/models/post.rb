class Post < ApplicationRecord
  validates_presence_of :title, :post, :user_id, :community_id
  belongs_to :community
  belongs_to :user

  mount_uploader :image, IconUploader
end
