module ApplicationHelper

  def page_title(title = '')
    base_title = 'Pokemon Usage Statistics'
    if title.empty?
      return base_title
    else
      return title + ' | ' + base_title
    end
  end
end
