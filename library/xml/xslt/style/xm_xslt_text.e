indexing

	description:

		"xsl:text element nodes"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_TEXT

inherit

	XM_XSLT_STRING_CONSTRUCTOR
		redefine
			validate, returned_item_type
		end

creation {XM_XSLT_NODE_FACTORY}

	make_style_element

feature -- Element change

	prepare_attributes is
			-- Set the attribute list for the element.
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			a_name_code: INTEGER
			an_expanded_name, a_doe_attribute: STRING
			an_error: XM_XPATH_ERROR_VALUE
		do
			from
				a_cursor := attribute_collection.name_code_cursor
				a_cursor.start
			variant
				attribute_collection.number_of_attributes + 1 - a_cursor.index				
			until
				a_cursor.after
			loop
				a_name_code := a_cursor.item
				an_expanded_name := shared_name_pool.expanded_name_from_name_code (a_name_code)
				if STRING_.same_string (an_expanded_name, Disable_output_escaping_attribute) then
					a_doe_attribute := attribute_value_by_index (a_cursor.index)
				end
				a_cursor.forth
			end

			if a_doe_attribute /= Void then
				if STRING_.same_string (a_doe_attribute, "yes") then
					report_compile_warning ("Disable Output Escaping is not supported by this implementation (ignored).%NUse character maps instead if you really need this feature.")
				elseif not STRING_.same_string (a_doe_attribute, "no") then
					create an_error.make_from_string ("disable-output-escaping attribute must be either 'yes' or 'no'", "", "XT0020", Static_error)
					report_compile_error (an_error)
				end
			end
			attributes_prepared := True
		end

	validate is
			-- Check that the stylesheet element is valid.
		local
			an_error: XM_XPATH_ERROR_VALUE
		do
			check_within_template
			if children.count > 1 then
				create an_error.make_from_string ("xsl:text may contain at most one child - a text node", "", "XT0010", Static_error)
				report_compile_error (an_error)
			elseif children.count = 1 then
				if first_child.node_type /= Text_node then
					create an_error.make_from_string ("Child of xsl:text must be a text node", "", "XT0010", Static_error)
				report_compile_error (an_error)
				end
			end
			Precursor
		end
			
	compile (an_executable: XM_XSLT_EXECUTABLE) is
			-- Compile `Current' to an excutable instruction.
		local
			a_string_value: XM_XPATH_STRING_VALUE
			a_text: XM_XSLT_COMPILED_TEXT
		do
			a_string_value ?= select_expression
			if a_string_value /= Void and then a_string_value.string_value.count = 0 then
				last_generated_instruction := Void -- empty xsl:text element is a no-op
			else
				create  a_text.make (an_executable, False)
				compile_content (an_executable, a_text)
				last_generated_instruction := a_text
			end
		end

feature {XM_XSLT_STYLE_ELEMENT} -- Restricted

	returned_item_type: XM_XPATH_ITEM_TYPE is
			-- Type of item returned by this instruction
		do
			Result := text_node_kind_test
		end

feature {NONE} -- Implementation

end
