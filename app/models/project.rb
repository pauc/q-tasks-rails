class Project < ActiveRecord::Base
  belongs_to :team
  has_many :goals

  validates :team, presence: true
  validates :name, presence: true, uniqueness: {
    scope: :team_id,
    case_sensitive: false
  }
end
