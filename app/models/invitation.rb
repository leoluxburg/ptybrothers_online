class Invitation < ApplicationRecord
  belongs_to :rider
  belongs_to :event
end
