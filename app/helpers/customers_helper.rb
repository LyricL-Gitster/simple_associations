module CustomersHelper

	def customer_table_for(customers)
		if customers.length == 0
			return ""
		end

		fields = ['name', 'contact', 'phone']
		table = "<table class='table table-striped'><thead><tr>"
		
		fields.each do |f|
			f_underscored = f.gsub(/:/,'_')
			table += "<th>#{f_underscored.titleize}</th>"
		end

		table += "<th></th><th></th>"
		table += "</tr></thead><tbody>"

		customers.each do |c|
			table += "<tr>"

			fields.each do |f|
				f_array = f.split(':')
				field = c.send f_array[0]
				if f_array.length == 2
					table += "<td>#{field.send f_array[1]}</td>"
				else
					table += "<td>#{field}</td>"
				end
			end

			new_order_link = link_to('Place Order', new_customer_order_path(c))
			table += "<td>#{new_order_link}</td>"
			view_order_link = link_to('View Orders', customer_orders_path(c))
			table += "<td>#{view_order_link}</td>"
			table += "</tr>"
		end
		table += "</tbody></table>"
		table.html_safe
	end
end
