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
	  direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
	  link_to title, :sort => column, :direction => direction
	end
end

