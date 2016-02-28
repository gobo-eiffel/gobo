note

	description:

		"xsl:next-match element nodes"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004-2015, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_NEXT_MATCH

inherit

	XM_XSLT_STYLE_ELEMENT
		redefine
			validate, may_contain_fallback
		end

create {XM_XSLT_NODE_FACTORY}

	make_style_element

feature -- Access

	may_contain_fallback: BOOLEAN
			-- Is `Current' allowed to contain an xsl:fallback?
		do
			Result := True
		end

feature -- Element change

	prepare_attributes
			-- Set the attribute list for the element.
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			a_name_code: INTEGER
		do
			if attached attribute_collection as l_attribute_collection then
				from
					a_cursor := l_attribute_collection.name_code_cursor
					a_cursor.start
				until
					a_cursor.after or any_compile_errors
				loop
					a_name_code := a_cursor.item
					check_unknown_attribute (a_name_code)
					a_cursor.forth
				variant
					l_attribute_collection.number_of_attributes + 1 - a_cursor.index
				end
			end
			attributes_prepared := True
		end

	validate
			-- Check that the stylesheet element is valid.
		do
			check_within_template
			check_only_with_parameter_content
			validated := True
		end

	compile (an_executable: XM_XSLT_EXECUTABLE)
			-- Compile `Current' to an excutable instruction.
		do
			create {XM_XSLT_COMPILED_NEXT_MATCH} last_generated_expression.make (an_executable,
																										with_param_instructions (an_executable, False),
																										with_param_instructions (an_executable, True))
		end

end
