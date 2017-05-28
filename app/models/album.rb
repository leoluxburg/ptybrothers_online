class Album < ApplicationRecord
  belongs_to :rider
  has_attachments :photos, maximum: 15

  # def owns_album?(album)
  #   self.albums.include?(album) ? true : false
  # end
end
