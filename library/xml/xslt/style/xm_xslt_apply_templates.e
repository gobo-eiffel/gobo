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
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			a_name_code: INTEGER
			an_expanded_name, a_select_attribute, a_mode_attribute: STRING
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
				if STRING_.same_string (an_expanded_name, Select_attribute) then
					a_select_attribute := attribute_value_by_index (a_cursor.index)
					STRING_.left_adjust (a_select_attribute)
					STRING_.right_adjust (a_select_attribute)
				elseif STRING_.same_string (an_expanded_name, Mode_attribute) then
					a_mode_attribute := attribute_value_by_index (a_cursor.index)
					STRING_.left_adjust (a_mode_attribute)
					STRING_.right_adjust (a_mode_attribute)
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
					-- do nothing
				else
					generate_name_code (a_mode_attribute)
					if last_generated_name_code = -1 then
						report_compile_error (name_code_error_value)
					end
					mode_name_code := last_generated_name_code
				end
			end
			attributes_prepared := True
		end

	validate is
			-- Check that the stylesheet element is valid.
		local
			a_child_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			a_sort: XM_XSLT_SORT
			a_param: XM_XSLT_WITH_PARAM
			a_node: XM_XPATH_NODE
			a_role: XM_XPATH_ROLE_LOCATOR
			a_type_checker: XM_XPATH_TYPE_CHECKER
			a_node_sequence: XM_XPATH_SEQUENCE_TYPE
			a_rule_manager: XM_XSLT_RULE_MANAGER
			an_error: XM_XPATH_ERROR_VALUE
		do
			check_within_template

			-- get the mode object

			if not use_current_mode then
				a_rule_manager := principal_stylesheet.rule_manager
				if not a_rule_manager.is_mode_registered (mode_name_code) then
					a_rule_manager.register_mode (mode_name_code)
				end
				mode := a_rule_manager.mode (mode_name_code)
			end

			from
				a_child_iterator := new_axis_iterator (Child_axis)
				a_child_iterator.start
			until
				any_compile_errors or else a_child_iterator.after
			loop
				a_node := a_child_iterator.item
				a_sort ?= a_node
				if a_sort /= Void then
					-- do nothing
				else
					a_param ?= a_node
					if a_param /= Void then
						-- do nothing
					elseif a_node.node_type = Text_node then
						if not is_all_whitespace (a_node.string_value) then
							create an_error.make_from_string ("No character data allowed within xsl:apply-templates",
																		 Xpath_errors_uri, "XTSE0010", Static_error)
							report_compile_error (an_error)
						end
					else
						create an_error.make_from_string ("Invalid element within xsl:apply-templates",
																	 Xpath_errors_uri, "XTSE0010", Static_error)
						report_compile_error (an_error)
					end
				end
				a_child_iterator.forth
			end
			if select_expression = Void then
				create {XM_XPATH_AXIS_EXPRESSION} select_expression.make (Child_axis, Void)
			end
			type_check_expression ("select", select_expression)
			if select_expression.was_expression_replaced then
				select_expression := select_expression.replacement_expression
			end
			create a_type_checker
			create a_role.make (Instruction_role, "xsl:apply-templates/select", 1,
									  Xpath_errors_uri, "XTTE0520")
			create a_node_sequence.make_node_sequence
			a_type_checker.static_type_check (static_context, select_expression, a_node_sequence, False, a_role)
			if a_type_checker.is_static_type_check_error	then
				report_compile_error (a_type_checker.static_type_check_error)
			else
				select_expression := a_type_checker.checked_expression
			end
			validated := True
		end

	compile (an_executable: XM_XSLT_EXECUTABLE) is
			-- Compile `Current' to an excutable instruction.
		local
			a_sort_key_list: DS_ARRAYED_LIST [XM_XSLT_SORT_KEY_DEFINITION]
			a_sorted_sequence: XM_XPATH_EXPRESSION
		do
			a_sorted_sequence := select_expression
			a_sort_key_list := sort_keys
			if a_sort_key_list.count > 0 then
				use_tail_recursion := False
				create {XM_XSLT_SORT_EXPRESSION} a_sorted_sequence.make (select_expression, a_sort_key_list)
			end
			create {XM_XSLT_COMPILED_APPLY_TEMPLATES} last_generated_expression.make (an_executable, a_sorted_sequence,
																											  with_param_instructions (an_executable, False),
																											  with_param_instructions (an_executable, True),
																											  use_current_mode, use_tail_recursion, mode)
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

invariant

	instruction: is_instruction = True

end
