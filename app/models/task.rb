class Task < ActiveRecord::Base
  belongs_to :job
  has_many :assignments
  has_many :users, through: :assignments

  validates :name, presence: true, uniqueness: { scope: :job_id }
end
