note

	description:

		"Objects that support the XPath trace() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_TRACE_ROUTINES

inherit

	KL_IMPORTED_STRING_ROUTINES

	KL_SHARED_STANDARD_FILES

feature -- Access

	trace_item (a_label: STRING; an_item: XM_XPATH_ITEM; a_context: XM_XPATH_CONTEXT)
			-- Write trace record.
		require
			item_may_be_void: True
			label_not_void: a_label /= Void
			context_not_void: a_context /= Void
		local
			a_configuration: XM_XPATH_CONFIGURATION
			a_value_string: STRING
		do
			a_configuration := a_context.configuration
			if a_configuration.is_tracing then
				if an_item = Void then
					a_value_string := "()"
				elseif an_item.is_error then
					a_value_string := an_item.error_value.error_message
				else
					a_value_string := an_item.string_value
				end
				a_configuration.trace (a_label, a_value_string)
			else
				if a_label.count > 0 then
					std.error.put_string (a_label)
					std.error.put_string (": ")
				end
				if an_item = Void then
					a_value_string := "()"
				elseif an_item.is_error then
					a_value_string := an_item.error_value.error_message
				else
					a_value_string := STRING_.concat (an_item.type_name, ": ")
					if an_item.is_node then
						a_value_string := STRING_.appended_string (a_value_string, an_item.as_node.path)
					else
						a_value_string := STRING_.appended_string (a_value_string, an_item.string_value)
					end
				end
				std.error.put_string (a_value_string)
				std.error.put_new_line
			end
		end

end

