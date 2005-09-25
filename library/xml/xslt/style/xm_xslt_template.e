indexing

	description:

		"xsl:template element nodes"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_TEMPLATE

inherit

	XM_XSLT_STYLE_ELEMENT
		redefine
			make_style_element, validate, returned_item_type, mark_tail_calls,
			may_contain_sequence_constructor, is_permitted_child, allocate_slots,
			is_template, as_template
		end

	XM_XSLT_PROCEDURE

	XM_XPATH_ROLE

	XM_XSLT_MODE_CONSTANTS

create {XM_XSLT_NODE_FACTORY}

	make_style_element

feature {NONE} -- Initialization
		
	make_style_element (an_error_listener: XM_XSLT_ERROR_LISTENER; a_document: XM_XPATH_TREE_DOCUMENT;  a_parent: XM_XPATH_TREE_COMPOSITE_NODE;
		an_attribute_collection: XM_XPATH_ATTRIBUTE_COLLECTION; a_namespace_list:  DS_ARRAYED_LIST [INTEGER];
		a_name_code: INTEGER; a_sequence_number: INTEGER; a_configuration: like configuration) is
			-- Establish invariant.
		do
			internal_fingerprint := -1 -- Not yet calculated, or not a named template
			create slot_manager.make
			Precursor (an_error_listener, a_document, a_parent, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, a_configuration)
		end

feature -- Access

	priority: MA_DECIMAL
			-- Priority of this template

	match: XM_XSLT_PATTERN
			-- Pattern match

	required_type: XM_XPATH_SEQUENCE_TYPE
			-- Required type for constructed sequence

	compiled_template: XM_XSLT_COMPILED_TEMPLATE
			-- Compiled version of `Current'

	template_fingerprint: INTEGER is
			-- Fingerprint of named template;
			-- This can be called before attributes are proceseed.
			-- WARNING: This is NOT a pure function - it is implemented 
			--  as a memo function, and also has a side effect
			--  of generating a name code in the name pool.
		local
			a_name: STRING
		do
			if internal_fingerprint = -1 then
				a_name := attribute_value_by_name ("", Name_attribute)
				if a_name /= Void then
					STRING_.left_adjust (a_name)
					STRING_.right_adjust (a_name)
					generate_name_code (a_name)
					internal_fingerprint := fingerprint_from_name_code (last_generated_name_code)
				end
			end
			Result := internal_fingerprint
		end

	redundant_named_template: BOOLEAN
			-- Current is a redundant named template

feature -- Status report

	may_contain_sequence_constructor: BOOLEAN is
			-- Is `Current' allowed to contain a sequence constructor?
		do
			Result := True
		end
	
	is_permitted_child (a_style_element: XM_XSLT_STYLE_ELEMENT): BOOLEAN is
			-- Is `a_style_element' a permitted child of `Current'?
		do
			Result := a_style_element.is_param
		end

feature -- Status setting

	mark_tail_calls is
			-- Mark tail-recursive calls on templates and functions.
		local
			a_last_instruction: XM_XSLT_STYLE_ELEMENT
		do
			if required_type = Void then

				-- Don't attempt tail call optimization if the return type needs checking

				a_last_instruction := last_child_instruction
				if a_last_instruction /= Void then
					a_last_instruction.mark_tail_calls
				end
			end
		end

feature -- Element change

	allocate_slots (an_expression: XM_XPATH_EXPRESSION; a_slot_manager: XM_XPATH_SLOT_MANAGER) is
			-- Allocate slots in the stack frame for local variables contained in `an_expression', which will include a match pattern.
		do
			an_expression.allocate_slots (1, a_slot_manager)
			containing_stylesheet.allocate_pattern_slots (an_expression.last_slot_number)
		end
	
	prepare_attributes is
			-- Set the attribute list for the element.
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			a_name_code: INTEGER
			an_expanded_name, a_name_attribute, a_mode_attribute, a_priority_attribute, a_match_attribute, an_as_attribute: STRING
			an_error: XM_XPATH_ERROR_VALUE
		do
			from
				a_cursor := attribute_collection.name_code_cursor
				a_cursor.start
			variant
				attribute_collection.number_of_attributes + 1 - a_cursor.index				
			until
				a_cursor.after
			loop a_name_code := a_cursor.item
				an_expanded_name := shared_name_pool.expanded_name_from_name_code (a_name_code)
				if STRING_.same_string (an_expanded_name, Name_attribute) then
					a_name_attribute := attribute_value_by_index (a_cursor.index)
					STRING_.left_adjust (a_name_attribute)
					STRING_.right_adjust (a_name_attribute)
				elseif STRING_.same_string (an_expanded_name, Mode_attribute) then
					a_mode_attribute := attribute_value_by_index (a_cursor.index)
					STRING_.left_adjust (a_mode_attribute)
					STRING_.right_adjust (a_mode_attribute)
				elseif STRING_.same_string (an_expanded_name, Priority_attribute) then
					a_priority_attribute := attribute_value_by_index (a_cursor.index)
					STRING_.left_adjust (a_priority_attribute)
					STRING_.right_adjust (a_priority_attribute)
				elseif STRING_.same_string (an_expanded_name, Match_attribute) then
					a_match_attribute := attribute_value_by_index (a_cursor.index)
				elseif STRING_.same_string (an_expanded_name, As_attribute) then
					an_as_attribute := attribute_value_by_index (a_cursor.index)
				else
					check_unknown_attribute (a_name_code)
				end
				a_cursor.forth
			end
			prepare_mode_attribute (a_mode_attribute, a_match_attribute = Void)
			if not any_compile_errors then
				prepare_name_attribute (a_name_attribute)
			end
			if not any_compile_errors then
				prepare_priority_attribute (a_priority_attribute, a_match_attribute = Void)
			end
			if not any_compile_errors and then a_match_attribute /= Void then
				generate_pattern (a_match_attribute)
				if not any_compile_errors then
					match := last_generated_pattern
					role_identifier := STRING_.concat ("match='", a_match_attribute)
					role_identifier := STRING_.appended_string (role_identifier, "'")
				end
			end
			if not any_compile_errors and then a_match_attribute = Void and then a_name_attribute = Void then
				create an_error.make_from_string ("xsl:template must have a name or match attribute (or both)", Xpath_errors_uri, "XTSE0010", Static_error)
				report_compile_error (an_error)
			end
			if an_as_attribute /= Void then
				generate_sequence_type (an_as_attribute)
				if not any_compile_errors then
					required_type := last_generated_sequence_type
				end
			end
			attributes_prepared := True
		end

	set_redundant_named_template is
			-- Mark as a redundant named template.
		do
			redundant_named_template := True
		ensure
			redundant_named_template_set:	redundant_named_template = True
		end

	validate is
			-- Check that the stylesheet element is valid.
			-- This is called once for each element, after the entire tree has been built.
			-- As well as validation, it can perform first-time initialisation.
		do
			check_top_level (Void)
			if match /= Void then
				type_check_pattern ("match", match)
			end
			mark_tail_calls
			validated := True
			create compiled_template.make -- so `{XM_XSLT_CALL_TEMPLATE}.compile' can forward-referenece to it
		end

	compile (an_executable: XM_XSLT_EXECUTABLE) is
			-- Compile `Current' to an excutable instruction.
		local
			a_rule_manager: XM_XSLT_RULE_MANAGER
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			a_mode: XM_XSLT_MODE
			a_name_code: INTEGER
			a_rule_value: XM_XSLT_RULE_VALUE
			a_content: XM_XPATH_EXPRESSION
			a_type_checker: XM_XPATH_TYPE_CHECKER
			a_role: XM_XPATH_ROLE_LOCATOR
			a_trace_wrapper: XM_XSLT_TRACE_INSTRUCTION
			a_context_item_type: XM_XPATH_ITEM_TYPE
		do
			compile_sequence_constructor (an_executable, new_axis_iterator (Child_axis), True)
			if last_generated_expression = Void then
				create {XM_XPATH_EMPTY_SEQUENCE} a_content.make
			else
				a_content := last_generated_expression
			end
			a_content.simplify
			if a_content.is_error then
				report_compile_error (a_content.error_value)
			else
				if a_content.was_expression_replaced then a_content := a_content.replacement_expression end
				if required_type /= Void then
					create a_role.make (Template_result_role, role_identifier, 1, Xpath_errors_uri, "XPTY0004")
					create a_type_checker
					a_type_checker.static_type_check (static_context, a_content, required_type, False, a_role)
					if a_type_checker.is_static_type_check_error	then
						report_compile_error (a_type_checker.static_type_check_error)
					else
						a_content := a_type_checker.checked_expression
					end	
				end
			end
			if not any_compile_errors then
				a_context_item_type := any_item
				if template_fingerprint = -1 then

					-- Template can't be called by name, so the context item will match the match pattern
					a_context_item_type := match.node_test
				end
				a_content.check_static_type (static_context, a_context_item_type)
				if a_content.is_error then
					report_compile_error (a_content.error_value)
				else
					if a_content.was_expression_replaced then a_content := a_content.replacement_expression end
					a_content.optimize (static_context, a_context_item_type)
					if a_content.was_expression_replaced then a_content := a_content.replacement_expression end
					if configuration.is_tracing then
						create a_trace_wrapper.make (a_content, an_executable, Current)
						a_trace_wrapper.set_source_location (principal_stylesheet.module_number (system_id), line_number)
						-- TODO: sort out - a_trace_wrapper.set_parent (compiled_template)
						a_content := a_trace_wrapper
					end
					compiled_template.initialize (an_executable, a_content, template_fingerprint, precedence, minimum_import_precedence, system_id, line_number, slot_manager)
					style_element_allocate_slots (a_content, slot_manager)
					if match /= Void then
						a_rule_manager := principal_stylesheet.rule_manager
						from
							a_cursor := mode_name_codes.new_cursor
							a_cursor.start
						variant
							mode_name_codes.count + 1 - a_cursor.index
						until
							a_cursor.after
						loop
							a_name_code := a_cursor.item
							if not a_rule_manager.is_mode_registered (a_name_code) then
								a_rule_manager.register_mode (a_name_code)
							end
							a_mode := a_rule_manager.mode (a_name_code)
							create a_rule_value.make (compiled_template)
							if is_priority_specified then
								a_rule_manager.set_handler (match, a_rule_value, a_mode, precedence, priority)
							else
								a_rule_manager.set_handler_with_default_priority (match, a_rule_value, a_mode, precedence)
							end
							a_cursor.forth
						end
					end
					if is_explaining or else principal_stylesheet.is_all_explaining then
						std.error.put_string ("Compiled template ")
						if template_fingerprint /= -1 then
							std.error.put_string (" name=")
							std.error.put_string (shared_name_pool.display_name_from_name_code (template_fingerprint))
						end
						if match /= Void then
							std.error.put_string (" match=")
							std.error.put_string (match.original_text)
						end
						std.error.put_new_line
						-- TODO - add mode names
						std.error.put_string (" Optimized template body:%N")
						compiled_template.body.display (2)
					end

				end
			end
			last_generated_expression := Void
		end

feature {XM_XSLT_STYLE_ELEMENT} -- Restricted

	returned_item_type: XM_XPATH_ITEM_TYPE is
			-- Type of item returned by this instruction
		do
			if required_type = Void then
				Result := common_child_item_type
			else
				Result := required_type.primary_type
			end
		end

feature -- Conversion

	is_template: BOOLEAN is
			-- Is `Current' an xsl:template?
		do
			Result := True
		end

	as_template: XM_XSLT_TEMPLATE is
			-- `Current' seen as an xsl:template
		do
			Result := Current
		end

feature {NONE} -- Implementation

	internal_fingerprint: INTEGER
			-- Used by `template_fingerprint'

	mode_name_codes: DS_ARRAYED_LIST [INTEGER]
			-- Name codes for the modes applicable to this template

	is_priority_specified: BOOLEAN
			-- has the priority been specified?

	role_identifier: STRING
			-- Role identificaton

	minimum_import_precedence: INTEGER is
			-- Lowest import pecedence
		local
			a_stylesheet: XM_XSLT_STYLESHEET
		do
			a_stylesheet ?= document_element
			check
				stylesheet: a_stylesheet /= Void
			end
			Result := a_stylesheet.minimum_import_precedence
		end

	prepare_mode_attribute (a_mode_attribute: STRING; is_match_attribute_void: BOOLEAN) is
			-- Prepare mode attribute
		require
			attributes_not_prepared: not attributes_prepared
			mode_name_codes_void: mode_name_codes = Void
		local
			a_splitter: ST_SPLITTER
			mode_tokens: DS_LIST [STRING]
			a_cursor: DS_LIST_CURSOR [STRING]
			a_mode: STRING
			an_error: XM_XPATH_ERROR_VALUE
		do
			if a_mode_attribute = Void then
				create mode_name_codes.make (1)
				mode_name_codes.put_last (Default_mode)
			else
				if is_match_attribute_void then
					create an_error.make_from_string ("The mode attribute must be absent if the match attribute is absent", Xpath_errors_uri, "XTSE0010", Static_error)
					report_compile_error (an_error)
				else
					create a_splitter.make
					mode_tokens := a_splitter.split (a_mode_attribute)
					if mode_tokens.count = 0 then
						create an_error.make_from_string ("The mode attribute must not be empty", Xpath_errors_uri, "XTSE0020", Static_error)
						report_compile_error (an_error)
					else
						create mode_name_codes.make (mode_tokens.count)
						from
							a_cursor := mode_tokens.new_cursor
							a_cursor.start
						variant
							mode_tokens.count + 1 - a_cursor.index
						until
							a_cursor.after
						loop
							a_mode := a_cursor.item
							if STRING_.same_string (a_mode, "#default") then
								mode_name_codes.put_last (Default_mode)
							elseif STRING_.same_string (a_mode, "#all") then
								if mode_tokens.count /= 1 then
									create an_error.make_from_string ("mode='#all' cannot be combined with other modes", Xpath_errors_uri, "XTSE0550", Static_error)
									report_compile_error (an_error)
								else
									mode_name_codes.put_last (All_modes)
								end
							elseif not is_qname (a_mode) then
								create an_error.make_from_string ("Mode names must be QNames or the token '#default' or the token '#all'", Xpath_errors_uri, "XTSE0550", Static_error)
								report_compile_error (an_error)
							else
								generate_name_code (a_mode)
								if last_generated_name_code = -1 then
									report_compile_error (name_code_error_value)
									a_cursor.go_after
								else
									mode_name_codes.put_last (last_generated_name_code)
								end
							end
							a_cursor.forth
						end
						if not any_compile_errors then
							check_all_modes_distinct
						end
					end
				end
			end
		ensure
			mode_name_codes_not_void: not any_compile_errors implies mode_name_codes /= Void
		end

	prepare_name_attribute (a_name_attribute: STRING) is
			-- Prepare name attribute
		local
			an_error: XM_XPATH_ERROR_VALUE
		do
			if a_name_attribute /= Void then
				if is_qname (a_name_attribute) then
					generate_name_code (a_name_attribute)
					if last_generated_name_code = -1 then
						report_compile_error (name_code_error_value)
					else
						internal_fingerprint := fingerprint_from_name_code (last_generated_name_code)
					end
					role_identifier := a_name_attribute
				else
					create an_error.make_from_string ("Template 'name' attribute must be a QName", Xpath_errors_uri, "XTSE0020", Static_error)
					report_compile_error (an_error)
				end
			end
		end

	prepare_priority_attribute (a_priority_attribute: STRING; is_match_attribute_void: BOOLEAN) is
			-- Prepare priority attribute
		local
			a_message: STRING
			a_decimal_parser: MA_DECIMAL_TEXT_PARSER
			an_error: XM_XPATH_ERROR_VALUE
		do
			if a_priority_attribute /= Void then
				is_priority_specified := True
				if is_match_attribute_void then
					create an_error.make_from_string ("The priority attribute must be absent if the match attribute is absent", Xpath_errors_uri, "XTSE0010", Static_error)
					report_compile_error (an_error)
				else
					create a_decimal_parser.make
					a_decimal_parser.parse (a_priority_attribute)
					if not a_decimal_parser.error then
						priority := a_decimal_parser.last_decimal
					else
						a_message := STRING_.appended_string ("Invalid numeric value for priority (", a_priority_attribute)
						a_message := STRING_.appended_string (a_message, ")")
						create an_error.make_from_string (a_message, Xpath_errors_uri, "XTSE0020", Static_error)
						report_compile_error (an_error)
					end
				end
			end
		end

	check_all_modes_distinct is
			-- Check no duplicate mode names.
		local
			a_set: DS_HASH_SET [INTEGER]
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			a_name_code: INTEGER
			an_error: XM_XPATH_ERROR_VALUE
		do
			create a_set.make (mode_name_codes.count)
			from
				a_cursor := mode_name_codes.new_cursor; a_cursor.start
			variant
				mode_name_codes.count + 1 - a_cursor.index
			until
				any_compile_errors or else a_cursor.after
			loop
				a_name_code := a_cursor.item
				if a_set.has (a_name_code) then
					create an_error.make_from_string ("Mode names must all be distinct", Xpath_errors_uri, "XTSE0550", Static_error)
					report_compile_error (an_error)
				else
					a_set.put (a_name_code)
				end
				a_cursor.forth
			end
		end

invariant

	mode_name_codes_not_void: attributes_prepared and then not any_compile_errors implies mode_name_codes /= Void

end
