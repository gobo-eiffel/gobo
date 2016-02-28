note

	description:

		"xsl:fallback element nodes"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004-2015, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_FALLBACK

inherit

	XM_XSLT_STYLE_ELEMENT
		redefine
			validate, may_contain_sequence_constructor, is_fallback
		end

create {XM_XSLT_NODE_FACTORY}

	make_style_element

feature -- Status_report

	may_contain_sequence_constructor: BOOLEAN
			-- Is `Current' allowed to contain a sequence constructor?
		do
			Result := True
		end

	is_fallback: BOOLEAN
			-- Is `Current' an xsl:fallback?
		do
			Result := True
		end

feature -- Element change

	prepare_attributes
			-- Set the attribute list for the element.
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			a_name_code: INTEGER
			an_expanded_name: STRING
		do
			if attached attribute_collection as l_attribute_collection then
				from
					a_cursor := l_attribute_collection.name_code_cursor
					a_cursor.start
				until
					a_cursor.after or any_compile_errors
				loop
					a_name_code := a_cursor.item
					an_expanded_name := shared_name_pool.expanded_name_from_name_code (a_name_code)
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
		local
			an_error: XM_XPATH_ERROR_VALUE
		do
			check attached {XM_XSLT_STYLE_ELEMENT} parent as a_parent then
				if not a_parent.may_contain_fallback then
					create an_error.make_from_string (STRING_.concat ("xsl:fallback is not allowed as a child of ", a_parent.node_name), Xpath_errors_uri, "XTSE0010", Static_error)
					report_compile_error (an_error)
				end
			end
			validated := True
		end

	compile (an_executable: XM_XSLT_EXECUTABLE)
			-- Compile `Current' to an excutable instruction.
		do

			-- If we get here, then the parent instruction is OK, so the fallback is not activated

			last_generated_expression := Void
		end

end

