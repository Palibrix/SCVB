class Project < ApplicationRecord
  has_many :project_technologies, dependent: :destroy
  has_many :technologies, through: :project_technologies

  has_many :worker_projects, dependent: :destroy
  has_many :workers, through: :worker_projects

  def name_with_company
    "#{name} - #{company}"
  end
end
