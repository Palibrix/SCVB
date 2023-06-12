class Education < ApplicationRecord
  has_many :worker_educations, dependent: :destroy
  has_many :workers, through: :worker_educations

  def name_with_term
    "#{name} - #{specialization} - #{term}"
  end
end
