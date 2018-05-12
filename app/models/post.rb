class Post < ApplicationRecord
  belongs_to :rider
  mount_uploader :foto, PhotoUploader
  # acts_as_votable
  has_reputation :likes, source: :user, aggregated_by: :sum

end
