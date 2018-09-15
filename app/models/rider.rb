class Rider < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  validates :user_name, :first_name, :last_name, :age, :country, presence: true, on: :update
  has_many :albums
  has_many :posts, dependent: :destroy
  has_many :comments

end
