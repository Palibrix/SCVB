class Technology < ApplicationRecord
  has_many :worker_technologies, dependent: :destroy
  has_many :workers, through: :worker_technologies

  has_many :project_technologies, dependent: :destroy
  has_many :projects, through: :project_technologies

  enum tools: { "Platform": 0,
                 "Language": 1,
                 "Framework": 2,
                 "Database": 3,
                 "Other": 4,
                 }

  validates :tool, inclusion: { in: Technology.tools.keys }

  def name_with_tool
    "#{name}: #{tool}"
  end
end
