class User < ActiveRecord::Base
  extend Devise::Models::Validatable::ClassMethods

  devise :database_authenticatable

  belongs_to :team
  has_many :assignments
  has_many :tasks, through: :assignments

  validates :email, presence: true, uniqueness: {
    scope: :team_id,
    case_sensitive: false
  }
  validates_format_of :email, with: email_regexp, allow_blank: true,
    if: :email_changed?
  validates :team, presence: :true
  validates :password, presence: true, if: :password_required?
  validates :password, length: { within: password_length },
    allow_blank: true

  private

  def password_required?
    !persisted? || !password.nil?
  end
end
