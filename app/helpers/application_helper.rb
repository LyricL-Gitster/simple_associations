module ApplicationHelper

	#creates a table using the given 'objects' with the given 'fields'.
	#'fields' should be an array of string objects
	#'fields' are split on ':'
	#Example: 'item:name' field will have 'Item Name' header with
	#object.item.name data
	def table_for(objects, fields)
		if objects.length == 0
			return ""
		end
		table = "<table class='table table-striped'><thead><tr>"
		fields.each do |f|
			f_underscored = f.gsub(/:/,'_')
			table += "<th>#{f_underscored.titleize}</th>"
		end
		table += "<th></th><th></th>"
		table += "</tr></thead><tbody>"
		objects.each do |o|
			table += "<tr>"
			fields.each do |f|
				f_array = f.split(':')
				field = o.send f_array[0]
				if f_array.length == 2
					table += "<td>#{field.send f_array[1]}</td>"
				else
					table += "<td>#{o.send f_array[0]}</td>"
				end
			end
			show_link = link_to('Show', o)
			table += "<td>#{show_link}</td>"
			class_name = o.class.name.singularize.downcase
			edit_path = send("edit_#{class_name}_path", o)
			edit_link = link_to('Edit', edit_path)
			table += "<td>#{edit_link}</td>"
			table += "</tr>"
		end
		table += "</tbody></table>"
		table.html_safe
	end
end
