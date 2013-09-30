module ApplicationHelper 
  
  def bootstrap_flash
   	flash_messages = []
   	flash.each do |type, message|
     		
     	case type
     	when :error
     		type = "danger"
     	when :notice
     		type = "info"
     	when :alert
     		type = "notice"
     	end
     
     	text = content_tag(:div, 
              content_tag(:button, raw("&times;"), :class => "close", "data-dismiss" => "alert") +
              message, :class => "alert alert-#{type}")
     	flash_messages << text if message
   	end
   	flash_messages.join("\n").html_safe
 	end
end
