module ApplicationHelper
  require 'redcarpet'

  def show_error_messages(object)
    render partial: 'shared/error_messages', locals: { object: object}
  end

  def render_markdown(text)
    options = {
      filter_html: true,
      hard_wrap: true,
      link_attributes: { rel: 'nofollow', target: "_blank" },
      space_after_headers: true,
    }

    extensions = {
      autolink: true,
      superscript: true,
      disable_intended_code_blocks: false,
      fenced_code_blocks: true,
      tables: true

    }

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    return markdown.render(text).html_safe
  end

end
