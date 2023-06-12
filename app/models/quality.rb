class Quality < ApplicationRecord
  has_many :worker_qualities, dependent: :destroy
  has_many :workers, through: :worker_qualities

end
