class Gameset < ApplicationRecord
  validates :name, :img, :ref, presence: true
  validates :ref, uniqueness: true
end
