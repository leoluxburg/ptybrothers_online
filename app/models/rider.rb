class Rider < ApplicationRecord
  belongs_to :user
  validates :user_name, :first_name, :last_name, presence: true, on: :update
  has_many :albums
end
