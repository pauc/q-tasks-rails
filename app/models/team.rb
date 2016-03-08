class Team < ActiveRecord::Base
  has_many :users
  has_many :projects
  has_many :jobs, through: :projects

  validates :subdomain, presence: true, uniqueness: true
  validates :name, presence: true
end
