indexing

	description:

		"xsl:apply-templates element nodes"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_APPLY_TEMPLATES

inherit

	XM_XSLT_STYLE_ELEMENT
		redefine
			make_style_element, validate
		end

creation {XM_XSLT_NODE_FACTORY}

	make_style_element

feature {NONE} -- Initialization
	
	make_style_element (an_error_listener: XM_XSLT_ERROR_LISTENER;a_document: XM_XPATH_TREE_DOCUMENT;  a_parent: XM_XPATH_TREE_COMPOSITE_NODE;
		an_attribute_collection: XM_XPATH_ATTRIBUTE_COLLECTION; a_namespace_list:  DS_ARRAYED_LIST [INTEGER];
		a_name_code: INTEGER; a_sequence_number: INTEGER; a_line_number: INTEGER; a_base_uri: STRING) is
			-- Establish invariant.
		do
			mode_name_code := -1 -- default mode
			is_instruction := True
			Precursor (an_error_listener, a_document, a_parent, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, a_line_number, a_base_uri)
		end

feature -- Element change

	prepare_attributes is
			-- Set the attribute list for the element.
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			a_name_code: INTEGER
			an_expanded_name, a_select_attribute, a_mode_attribute, a_message: STRING
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
				an_expanded_name := document.name_pool.expanded_name_from_name_code (a_name_code)
				if STRING_.same_string (an_expanded_name, Select_attribute) then
					a_select_attribute := attribute_value_by_index (a_cursor.index)
					a_select_attribute.left_adjust
					a_select_attribute.right_adjust
				elseif STRING_.same_string (an_expanded_name, Mode_attribute) then
					a_mode_attribute := attribute_value_by_index (a_cursor.index)
					a_mode_attribute.left_adjust
					a_mode_attribute.right_adjust
				else
					check_unknown_attribute (a_name_code)
				end
				a_cursor.forth
			end
			if a_select_attribute /= Void then
				generate_expression (a_select_attribute)
				select_expression := last_generated_expression
			end
			if a_mode_attribute /= Void then
				if STRING_.same_string (a_mode_attribute, "#current") then
					use_current_mode := True
				elseif STRING_.same_string (a_mode_attribute, "#default") then
					do_nothing
				else
					generate_name_code (a_mode_attribute)
					if last_generated_name_code = -1 then
						a_message := STRING_.appended_string ("Mode name ", a_mode_attribute)
						a_message := STRING_.appended_string (a_message, " is not a recognised QName")
						report_compile_error (a_message)
					end
					mode_name_code := last_generated_name_code
				end
			end
			attributes_prepared := True
		end

	validate is
			-- Check that the stylesheet element is valid.
			-- This is called once for each element, after the entire tree has been built.
			-- As well as validation, it can perform first-time initialisation.
		do
			todo ("validate", False)
			validated := True
		end

	compile (compile_to_eiffel: BOOLEAN) is
			-- Compile `Current' to an excutable instruction, 
			--  or to Eiffel code.
		do
			todo ("compile", False)
		end

feature {NONE} -- Implementation

	mode_name_code: INTEGER
			-- Name code of mode

	use_current_mode: BOOLEAN
			-- Use current mode

	select_expression: XM_XPATH_EXPRESSION
			-- Value of 'select' attribute

invariant

	instruction: is_instruction = True

end
