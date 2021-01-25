class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable,
         :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  def self.create_from_provider_data(provider_data)
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do | user |
      user.email = provider_data.info.email
      user.username = provider_data.info.email
      user.password = Devise.friendly_token[0, 20]
      user.skip_confirmation!
    end
  end

  mount_uploader :avatar, IconUploader
        
  validates_uniqueness_of :username
  validates_presence_of :username

  # has_one_attached :avatar, dependant: :destroy
  # validates :avatar, content_type: :png, :jpg, :jpeg

  has_many :communities, through: :subscriptions
  has_many :posts
  has_many :votes, dependent: :destroy
end
