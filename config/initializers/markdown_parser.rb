MarkdownParser = Redcarpet::Markdown.new(
  Redcarpet::Render::HTML.new(hard_wrap: true), {
    autolink: true,
    disable_indented_code_blocks: true,
    fenced_code_blocks: true,
    no_intra_emphasis: true,
    strikethrough: true,
    underline: true,
    tables: true,
  }
)
