class Message < ApplicationRecord
  belongs_to :player
  belongs_to :coach
end
