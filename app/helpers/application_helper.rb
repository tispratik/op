module ApplicationHelper
  
  def sort_link(title, column, options = {})
    condition = options[:unless] if options.has_key?(:unless)
    sort_dir = params[:d] == 'up' ? 'down' : 'up'
    sort_dir_searchlogic = params[:d] == 'up' ? 'descend_by' : 'ascend_by'
    arrow = ""
    if  column.to_s.eql?(params[:c])
      arrow = params[:d]== "down" ? "&#8595;" : "&#8593;" 
    end
    
     (link_to_unless condition, title, request.parameters.merge( {:c => column, :d => sort_dir, :sort => sort_dir_searchlogic} )) + arrow 
  end
  
  
  def url_name(object, controller_name)
    object.nil? ? "" : href_tag(url_only(object, controller_name), object.to_s)
  end
  
  def url_only(object, controller_name)
    return url_for(:controller => controller_name, :action => :show, :id => object.id) unless object.nil?
  end
  
  
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
