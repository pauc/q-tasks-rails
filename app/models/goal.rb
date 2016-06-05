class Goal < ActiveRecord::Base
  belongs_to :project
  has_many :attachments, dependent: :destroy
  has_many :tasks

  validates :project, presence: true
  validates :name, presence: true, uniqueness: { scope: :project_id }
end
