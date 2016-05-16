require 'rouge/plugins/redcarpet'

module MarkdownParser
  extend self

  class Renderer < Redcarpet::Render::HTML
    include Rouge::Plugins::Redcarpet

    def rouge_formatter(lexer)
      ::Rouge::Formatters::HTML.new(
        css_class: "highlight #{lexer.tag}",
        inline_theme: "github"
      )
    end
  end

  RENDERER = Redcarpet::Markdown.new(
    Renderer.new(
      hard_wrap: true,
      filter_html: true
    ), {
      autolink: true,
      disable_indented_code_blocks: true,
      fenced_code_blocks: true,
      no_intra_emphasis: true,
      strikethrough: true,
      underline: true,
      tables: true,
    }
  )

  def call(markdown)
    RENDERER.render(markdown)
  end
end

