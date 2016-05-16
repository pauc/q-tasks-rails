class Task < ActiveRecord::Base
  belongs_to :goal
  has_many :assignments
  has_many :users, through: :assignments
  has_many :task_dependencies, foreign_key: :dependent_task_id,
    inverse_of: :dependent_task
  has_many :inverse_task_dependency, class_name: "TaskDependency",
    foreign_key: :dependency_task_id, inverse_of: :dependency_task
  has_many :dependencies, through: :task_dependencies,
    source: :dependency_task
  has_many :dependent_tasks, through: :inverse_task_dependency,
    source: :dependent_task

  validates :name, uniqueness: {
    scope:          :goal_id,
    case_sensitive: false
  }, allow_blank: true

  acts_as_list scope: :goal

  def description_markdown=(text)
    input = Loofah.fragment(text)

    sanitized_description = input.scrub!(sanitizer).to_s

    self.description_html = MarkdownParser.render(sanitized_description)

    super(sanitized_description)
  end

  def sanitizer
     @sanitizer ||= Rails::Html::PermitScrubber.new
       .tap { |sanitzr| sanitzr.tags = ['a'] }
  end
end
