note

	description:

		"xsl:output-character element nodes"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004-2022, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_OUTPUT_CHARACTER

inherit

	XM_XSLT_STYLE_ELEMENT
		redefine
			validate
		end

create

	make_style_element

feature -- Access

	code: INTEGER
			-- Unicode code-point of character to be replaced

	replacement_string: detachable STRING
			-- Replacement string

feature -- Element change

	prepare_attributes
			-- Set the attribute list for the element.
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			a_name_code: INTEGER
			an_expanded_name, a_character_attribute: STRING
			an_error: XM_XPATH_ERROR_VALUE
		do
			code := -1
			if attached attribute_collection as l_attribute_collection then
				from
					a_cursor := l_attribute_collection.name_code_cursor
					a_cursor.start
				until
					a_cursor.after or any_compile_errors
				loop
					a_name_code := a_cursor.item
					an_expanded_name := shared_name_pool.expanded_name_from_name_code (a_name_code)
					if STRING_.same_string (an_expanded_name, Character_attribute) then
						a_character_attribute := attribute_value_by_index (a_cursor.index)
						if a_character_attribute.count /= 1 then
							create an_error.make_from_string ("xsl:output-character's 'character' attribute must be a single XML character", Gexslt_eiffel_type_uri, "OUTPUT_CHARACTER", Static_error)
							report_compile_error (an_error)
						else
							code := a_character_attribute.code (1).to_integer_32
						end
					elseif STRING_.same_string (an_expanded_name, String_attribute) then
						replacement_string := attribute_value_by_index (a_cursor.index)
					else
						check_unknown_attribute (a_name_code)
					end
					a_cursor.forth
				variant
					l_attribute_collection.number_of_attributes + 1 - a_cursor.index
				end
			end
			if code = -1 then
				report_absence ("character")
			elseif replacement_string = Void then
				report_absence ("string")
			end
			attributes_prepared := True
		end

	validate
			-- Check that the stylesheet element is valid.
		local
			an_error: XM_XPATH_ERROR_VALUE
		do
			if not attached {XM_XSLT_CHARACTER_MAP} parent then
				create an_error.make_from_string ("xsl:output-character may appear only as a direct child of xsl:character-map", Xpath_errors_uri, "XTSE0010", Static_error)
				report_compile_error (an_error)
			end
		end

	compile (an_executable: XM_XSLT_EXECUTABLE)
			-- Compile `Current' to an excutable instruction.
		do
			last_generated_expression := Void
		end

end
