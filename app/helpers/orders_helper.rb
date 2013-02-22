module OrdersHelper
	def order_table_for(customer)
		orders = customer.orders
		fields = ['item:name', 'quantity', 'total_cost']

		if orders.length == 0
			return ""
		end

		table = "<table class='table table-striped'><thead><tr>"
		
		fields.each do |f|
			f_underscored = f.gsub(/:/,'_')
			table += "<th>#{f_underscored.titleize}</th>"
		end
		
		table += "<th></th><th></th>"
		table += "</tr></thead><tbody>"
		
		orders.each do |o|
			table += "<tr>"
			fields.each do |f|
				f_array = f.split(':')
				field = o.send f_array[0]
				
				if f_array.length == 2
					table += "<td>#{field.send f_array[1]}</td>"
				else
					table += "<td>#{field}</td>"
				end
			end

		new_order_link = link_to('View', customer_order_path(o.customer,o))
		table += "<td>#{new_order_link}</td>"
		view_order_link = link_to('Edit', edit_customer_order_path(o.customer,o))
		table += "<td>#{view_order_link}</td>"
		table += "</tr>"
		end

		table += "</tbody></table>"
		table.html_safe
	end
end
