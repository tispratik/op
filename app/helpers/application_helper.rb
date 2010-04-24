module ApplicationHelper
  
  def markdown(text)
    # text = sanitize(text, :tags => %w(object param embed))
    text.gsub!(/<script.*>.*<\/script>/, '')
    if defined? RDiscount
      process_html_links RDiscount.new(text, :smart).to_html.gsub(/\n+/, "<br/>")
    else
      simple_format(process_html_links(text))
    end
  end
  
  def process_html_links(text)
    url_re = %r{
      (<[^>]+\s+\w+="?)?
      (
        (?:https?://)?              # optional protocol
        (?:[-\w]+\.)+               # subdomain/domain parts
        (?:com|net|org|edu|gov|biz|int|mil|info|name|museum|coop|aero|[a-z][a-z]) # TLD
        (?::\d+)?                   # Optional port
        (?:/(?:(?:[~\w\+@%=-]|(?:[,.;:][^\s$]))+)?)*     # Path
        (?:\?[\w\+@%&=.;-]+)?       # Query String ?foo=bar
        (?:\#[\w\-]*)?              # Anchor
      )
    }xi
    
    # wrap links for html
    text.gsub! url_re do
      if $1.present?
        $&
      else
        url = $2
        unless url =~ /:\/\//
          url = "http://" + url
        end
        "<a href=\"#{url}\">#{url}</a>"
      end
    end
    text.gsub(/<a\s/, '<a target=\"_blank\" ')
  end
  
  def show_flash_messages
    str = ""
    flash.each do |name, msg|
      str += <<-eos
      $("#flash_messages").html("#{escape_javascript(content_tag :div, flash.delete(name), :class => "flash #{name}")}");
      eos
    end
    str
  end
  
end
