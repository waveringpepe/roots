module ApplicationHelper
	def flash_class_name(name)
	    case name
	    when 'notice' then 'success'
	    when 'alert'  then 'danger'
	    else name
	    end
	end

	def check_active_user
	  forbidden! unless current_user.active
	end


	def sortable(column, title = nil)
	  title ||= column.titleize
	  css_class = column == sort_column ? "current #{sort_direction}" :nil
	  direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
	  link_to title,  request.params.merge(sort: column, direction: direction, page: nil), { class: "css_class font-weight-normal" }
	end
end

