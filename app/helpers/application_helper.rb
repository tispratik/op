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
  
  def smart_date(i)
    return "" if i.blank?
    i.year == Time.now.year ? i.strftime("%d-%b") : i.strftime("%d-%b-%Y")
  end
  
  def smart_due_date(i)
    if i == nil
      return ""
    end
    if Date.today == i
      return "<span style=\"background-color:#F7FAB9;padding:0px 2px 0px 2px;\">Today</span>"
    end  
    if i-(Date.today) == 1
      return "<span style=\"background-color:#F7FAB9;padding:0px 2px 0px 2px;\">Tomorrow</span>"
    end  
    if Date.today-(i) > 0.9
      return "<span style=\"background-color:#FFC7C7;padding:0px 2px 0px 2px;\">" +  smart_date(i) + "</span>"
    end
    if Date.today-(i) < 1
      return "<span style=\"background-color:#D2FFCC;padding:0px 2px 0px 2px;\">" +  smart_date(i) + "</span>"
    end
    return smart_date(i)
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
  
  #  def filter_html(filter_name)
  #    filter_list = Filter.filter_name_eq(filter_name)
  #    return "" if filter_list.blank?
  #    
  #    str = "<table>" + "<tr>"
  #    
  #    param_internal_name = ""
  #    
  #    filter_list.each do |filter_name|
  #      str = str + "<td>"
  #      str = str + "<div id=\"bold_text\">" + filter_name.display_name + "</div>"
  #      filter_name.get_params.each do |param|
  #        checked = ""
  #        if params[param.internal_param] == param.internal_value
  #          checked = "checked"
  #        end
  #        str = str + "<input type=radio name=" + param.internal_param + " value= '" + param.internal_value + "' " + checked + ">" + param.disp_value + "</input><br>"
  #        param_internal_name = param.internal_param
  #      end
  #      str = str + "<input type=radio name=" + param_internal_name + " value="+ Decode::ANY + ">Any</input><br>"
  #      str = str + "</td>"
  #    end
  #    str = str + "<td><input type='submit' value='Apply Filter'></td>"
  #    str = str + "</tr>" + "</table>"
  #    return str
  #  end
  
  def filter_html(filter_name)
    filter_list = Filter.filter_name_eq(filter_name)
    return "" if filter_list.blank?
    
    str =  ""
    param_internal_name = ""
    
    filter_list.each do |filter_name|
      str = str + "<div id=\"bold_text\">" + filter_name.display_name + "</div>"
      filter_name.get_params.each do |param|
        checked = ""
        if params[param.internal_param] == param.internal_value
          checked = "checked"
        end
        str = str + "<input type=radio name=" + param.internal_param + " value= '" + param.internal_value + "' " + checked + ">" + param.disp_value + "</input><br>"
        param_internal_name = param.internal_param
      end
      str = str + "<input type=radio name=" + param_internal_name + " value="+ Decode::ANY + ">Any</input><br>"
      str = str + "<br />"
    end
    str = str + "<input type='submit' value='Apply Filter'>"
    return str
  end
  
end
