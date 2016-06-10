class Comment < ActiveRecord::Base
  belongs_to :task
  belongs_to :user

  def body_markdown=(text)
    self.body_html = MarkdownParser.call(text.to_s)

    super
  end
end
