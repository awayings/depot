module ApplicationHelper
  def hidden_div_if(condition, attributes = {}, &block)
    if condition
      attributes["style"] = "display: none"
    end
      logger.error "testx:#{attributes['id']}"
    content_tag("div", attributes, &block)
  end

end
