class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  mount_uploader :avatar, IconUploader
        
  validates_uniqueness_of :username

  # has_one_attached :avatar, dependant: :destroy
  # validates :avatar, content_type: :png, :jpg, :jpeg

  has_many :communities, through: :subscriptions
end
