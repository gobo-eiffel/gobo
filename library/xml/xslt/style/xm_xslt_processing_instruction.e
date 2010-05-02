note

	description:

		"xsl:processing-instruction element nodes"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_PROCESSING_INSTRUCTION

inherit

	XM_XSLT_STRING_CONSTRUCTOR
		redefine
			validate, make_style_element
		end

create {XM_XSLT_NODE_FACTORY}

	make_style_element

feature {NONE} -- Initialization

	make_style_element (an_error_listener: XM_XSLT_ERROR_LISTENER; a_document: XM_XPATH_TREE_DOCUMENT;  a_parent: XM_XPATH_TREE_COMPOSITE_NODE;
		an_attribute_collection: XM_XPATH_ATTRIBUTE_COLLECTION; a_namespace_list:  DS_ARRAYED_LIST [INTEGER];
		a_name_code: INTEGER; a_sequence_number: INTEGER; a_configuration: like configuration)
			-- Establish invariant.
		do
			is_instruction := True
			Precursor (an_error_listener, a_document, a_parent, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, a_configuration)
		end

feature -- Access

	name: XM_XPATH_EXPRESSION
			-- Name of processing-instruction

	select_and_content_error: STRING
			-- Error code when both select expression and content are mutually exclusive
		do
			Result := "XTSE0880"
		end

feature -- Element change

	prepare_attributes
			-- Set the attribute list for the element.
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			a_name_code: INTEGER
			an_expanded_name, a_name_attribute, a_select_attribute: STRING
		do
			if attribute_collection /= Void then
				from
					a_cursor := attribute_collection.name_code_cursor
					a_cursor.start
				until
					a_cursor.after or any_compile_errors
				loop
					a_name_code := a_cursor.item
					an_expanded_name := shared_name_pool.expanded_name_from_name_code (a_name_code)
					if STRING_.same_string (an_expanded_name, Select_attribute) then
						a_select_attribute := attribute_value_by_index (a_cursor.index)
						STRING_.left_adjust (a_select_attribute)
						STRING_.right_adjust (a_select_attribute)
					elseif STRING_.same_string (an_expanded_name, Name_attribute) then
						a_name_attribute := attribute_value_by_index (a_cursor.index)
						STRING_.left_adjust (a_name_attribute)
						STRING_.right_adjust (a_name_attribute)
					end
					a_cursor.forth
				variant
					attribute_collection.number_of_attributes + 1 - a_cursor.index
				end
			end
			if a_name_attribute = Void then
				report_absence ("name")
			else
				generate_attribute_value_template (a_name_attribute, static_context)
				name := last_generated_expression
			end
			if a_select_attribute /= Void then
				generate_expression (a_select_attribute)
				select_expression := last_generated_expression
				if select_expression.is_error then
					report_compile_error (select_expression.error_value)
				end
			end
			attributes_prepared := True
		end

	validate
			-- Check that the stylesheet element is valid.
		local
			l_replacement: DS_CELL [XM_XPATH_EXPRESSION]
		do
			check_within_template
			if select_expression /= Void then
				create l_replacement.make (Void)
				type_check_expression (l_replacement, "select", select_expression)
				select_expression := l_replacement.item
			end
			create l_replacement.make (Void)
			type_check_expression (l_replacement, "name", name)
			name := l_replacement.item
			Precursor
		end

	compile (a_executable: XM_XSLT_EXECUTABLE)
			-- Compile `Current' to an excutable instruction.
		local
			l_string_value: XM_XPATH_STRING_VALUE
			l_pi: XM_XSLT_COMPILED_PROCESSING_INSTRUCTION
		do
			create l_pi.make (a_executable, name)
			create l_string_value.make (" ")
			compile_content (a_executable, l_pi, l_string_value)
			last_generated_expression := l_pi
		end

end
