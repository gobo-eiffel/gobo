indexing

	description:

		"xsl:apply-templates element nodes"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_APPLY_TEMPLATES

inherit

	XM_XSLT_STYLE_ELEMENT
		redefine
			make_style_element, validate, mark_tail_calls, is_apply_templates
		end

	XM_XPATH_ROLE

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

create {XM_XSLT_NODE_FACTORY}

	make_style_element

feature {NONE} -- Initialization

	make_style_element (an_error_listener: XM_XSLT_ERROR_LISTENER;a_document: XM_XPATH_TREE_DOCUMENT;  a_parent: XM_XPATH_TREE_COMPOSITE_NODE;
		an_attribute_collection: XM_XPATH_ATTRIBUTE_COLLECTION; a_namespace_list:  DS_ARRAYED_LIST [INTEGER];
		a_name_code: INTEGER; a_sequence_number: INTEGER; a_configuration: like configuration) is
			-- Establish invariant.
		do
			mode_name_code := -1 -- default mode
			is_instruction := True
			Precursor (an_error_listener, a_document, a_parent, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, a_configuration)
		end

feature -- Status setting

	mark_tail_calls is
			-- Mark tail-recursive calls on templates and functions.
		do
			use_tail_recursion := True
		end

feature -- Element change

	prepare_attributes is
			-- Set the attribute list for the element.
		local
			l_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			l_name_code: INTEGER
			l_expanded_name, l_select_attribute, l_mode_attribute: STRING
		do
			if attribute_collection /= Void then
				from
					l_cursor := attribute_collection.name_code_cursor
					l_cursor.start
				until
					l_cursor.after or any_compile_errors
				loop
					l_name_code := l_cursor.item
					l_expanded_name := shared_name_pool.expanded_name_from_name_code (l_name_code)
					if STRING_.same_string (l_expanded_name, Select_attribute) then
						l_select_attribute := attribute_value_by_index (l_cursor.index)
						STRING_.left_adjust (l_select_attribute)
						STRING_.right_adjust (l_select_attribute)
					elseif STRING_.same_string (l_expanded_name, Mode_attribute) then
						l_mode_attribute := attribute_value_by_index (l_cursor.index)
						STRING_.left_adjust (l_mode_attribute)
						STRING_.right_adjust (l_mode_attribute)
					else
						check_unknown_attribute (l_name_code)
					end
					l_cursor.forth
				variant
					attribute_collection.number_of_attributes + 1 - l_cursor.index	
				end
			end
			if l_select_attribute /= Void then
				generate_expression (l_select_attribute)
				select_expression := last_generated_expression
			else
				is_select_defaulted := True
			end
			if l_mode_attribute /= Void then
				if STRING_.same_string (l_mode_attribute, "#current") then
					use_current_mode := True
				elseif STRING_.same_string (l_mode_attribute, "#default") then
					-- do nothing
				else
					if is_qname (l_mode_attribute) then
						generate_name_code (l_mode_attribute)
						if last_generated_name_code = -1 then
							report_compile_error (name_code_error_value)
						end
						mode_name_code := last_generated_name_code
					else
						report_compile_error (create {XM_XPATH_ERROR_VALUE}.make_from_string (STRING_.concat (l_mode_attribute, " is not a valid lexical QName"), Xpath_errors_uri, "XTSE0020", Static_error))
					end
				end
			end
			attributes_prepared := True
		end

	validate is
			-- Check that the stylesheet element is valid.
		local
			l_child_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			l_sort: XM_XSLT_SORT
			l_param: XM_XSLT_WITH_PARAM
			l_node: XM_XPATH_NODE
			l_role: XM_XPATH_ROLE_LOCATOR
			l_type_checker: XM_XPATH_TYPE_CHECKER
			l_node_sequence: XM_XPATH_SEQUENCE_TYPE
			l_rule_manager: XM_XSLT_RULE_MANAGER
			l_error: XM_XPATH_ERROR_VALUE
			l_replacement: DS_CELL [XM_XPATH_EXPRESSION]
		do
			check_within_template

			-- get the mode object

			if not use_current_mode then
				l_rule_manager := principal_stylesheet.rule_manager
				if not l_rule_manager.is_mode_registered (mode_name_code) then
					l_rule_manager.register_mode (mode_name_code)
				end
				mode := l_rule_manager.mode (mode_name_code)
			end

			from
				l_child_iterator := new_axis_iterator (Child_axis)
				l_child_iterator.start
			until
				any_compile_errors or else l_child_iterator.after
			loop
				l_node := l_child_iterator.item
				l_sort ?= l_node
				if l_sort /= Void then
					-- do nothing
				else
					l_param ?= l_node
					if l_param /= Void then
						-- do nothing
					elseif l_node.node_type = Text_node then
						if not is_all_whitespace (l_node.string_value) then
							create l_error.make_from_string ("No character data allowed within xsl:apply-templates",
																		 Xpath_errors_uri, "XTSE0010", Static_error)
							report_compile_error (l_error)
						end
					else
						create l_error.make_from_string ("Invalid element within xsl:apply-templates",
																	 Xpath_errors_uri, "XTSE0010", Static_error)
						report_compile_error (l_error)
					end
				end
				l_child_iterator.forth
			end
			if select_expression = Void then
				create {XM_XPATH_AXIS_EXPRESSION} select_expression.make (Child_axis, Void)
			end
			create l_replacement.make (Void)
			type_check_expression (l_replacement, "select", select_expression)
			if not any_compile_errors then
				select_expression := l_replacement.item
				create l_type_checker
				create l_role.make (Instruction_role, "xsl:apply-templates/select", 1,
					Xpath_errors_uri, "XTTE0520")
				create l_node_sequence.make_node_sequence
				l_type_checker.static_type_check (static_context, select_expression, l_node_sequence, False, l_role)
				if l_type_checker.is_static_type_check_error	then
					report_compile_error (l_type_checker.static_type_check_error)
				else
					select_expression := l_type_checker.checked_expression
				end
			end
			validated := True
		end

	compile (an_executable: XM_XSLT_EXECUTABLE) is
			-- Compile `Current' to an excutable instruction.
		local
			l_sort_key_list: DS_ARRAYED_LIST [XM_XSLT_SORT_KEY_DEFINITION]
			l_sorted_sequence: XM_XPATH_EXPRESSION
		do
			l_sorted_sequence := select_expression
			assemble_sort_keys
			if not any_compile_errors then
				l_sort_key_list := sort_keys
				if l_sort_key_list.count > 0 then
					use_tail_recursion := False
					create {XM_XSLT_SORT_EXPRESSION} l_sorted_sequence.make (select_expression, l_sort_key_list)
				end
				create {XM_XSLT_COMPILED_APPLY_TEMPLATES} last_generated_expression.make (an_executable, l_sorted_sequence,
					with_param_instructions (an_executable, False),
					with_param_instructions (an_executable, True),
					use_current_mode, use_tail_recursion, mode, is_select_defaulted)
			end
		end

feature -- Conversion

	is_apply_templates: BOOLEAN is
			-- Is `Current' an xsl:apply-templates?
		do
			Result := True
		end

feature {NONE} -- Implementation

	mode: XM_XSLT_MODE
			-- Mode to use

	mode_name_code: INTEGER
			-- Name code of mode

	use_current_mode: BOOLEAN
			-- Use current mode

	use_tail_recursion: BOOLEAN
			-- Use tail recursion

	select_expression: XM_XPATH_EXPRESSION
			-- Value of 'select' attribute

	is_select_defaulted: BOOLEAN
			-- `True' if select attribute was omitted

invariant

	instruction: is_instruction = True

end
