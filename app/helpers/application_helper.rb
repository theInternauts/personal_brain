module ApplicationHelper
	def page_counter(page=1, per_page=Kaminari.config.default_per_page, index=0, padding=10)
		"#{(per_page.to_i * (page.to_i-1))+index+1}".ljust(padding, '.')
	end
end
