class Community < ApplicationRecord
  belongs_to :user
  validates_presence_of :user_id, :name, :description
  has_many :subscriptions
  has_many :subscribers, through: :subscriptions, source: :user

end
