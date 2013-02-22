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
					table += "<td>#{field}</td>"
				end
			end
		end

		table += "</tbody></table>"
		table.html_safe
	end
end
