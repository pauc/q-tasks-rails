class Team < ActiveRecord::Base
  has_many :users
  has_many :projects
  has_many :goals, through: :projects
  has_many :tasks, through: :goals

  validates :subdomain, presence: true, uniqueness: true
  validates :name, presence: true
end
