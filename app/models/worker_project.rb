class WorkerProject < ApplicationRecord
  belongs_to :worker
  belongs_to :project
end
