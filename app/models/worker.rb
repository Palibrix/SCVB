class Worker < ApplicationRecord
  has_many :worker_languages, dependent: :destroy
  has_many :languages, through: :worker_languages

  has_many :worker_educations, dependent: :destroy
  has_many :educations, through: :worker_educations

  has_many :worker_projects, dependent: :destroy
  has_many :projects, through: :worker_projects

  has_many :worker_technologies, dependent: :destroy
  has_many :technologies, through: :worker_technologies

  has_many :worker_qualities, dependent: :destroy
  has_many :qualities, through: :worker_qualities

end


