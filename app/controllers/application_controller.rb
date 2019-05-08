class ApplicationController < ActionController::Base
	before_action :set_locale
	protect_from_forgery with: :exception
	before_action :set_timezone 

	include DeviseWhitelist
	include CurrentUserConcern

	def set_locale
	     I18n.locale = params[:locale] || I18n.default_locale
	end

	def default_url_options
	  { locale: I18n.locale }
	end

	def set_timezone  
		Time.zone = current_user.time_zone
	end  

	def custom_paginate_renderer
		Class.new(WillPaginate::ActionView::LinkRenderer) do
			def container_attributes
				{class: "tc cf mv2"}
			end

			def page_number(page)
				if page == current_page
				  tag(:span, page, class: 'b bg-dark-blue near-white ba b--near-black pa2')
				else
				  link(page, page, class: 'link ba b--near-black near-black pa2', rel: rel_value(page))
				end
			end

			def gap
				text = @template.will_paginate_translate(:page_gap) { '&hellip;' }
				%(<span class="mr2">#{text}</span>)
			end

			def previous_page
				num = @collection.current_page > 1 && @collection.current_page - 1
				previous_or_next_page(num, @options[:previous_label], 'link ba near-black b--near-black pa2')
			end

			def next_page
				num = @collection.current_page < total_pages && @collection.current_page + 1
				previous_or_next_page(num, @options[:next_label], 'link ba near-black b--near-black pa2')
			end

			def previous_or_next_page(page, text, classname)
				if page
				  link(text, page, :class => classname)
				else
				  tag(:span, text, :class => classname + ' bg-dark-blue near-white')
				end
			end
		end
	end
end	