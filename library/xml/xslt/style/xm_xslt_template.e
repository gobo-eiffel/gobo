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
			make_style_element, validate, returned_item_type, mark_tail_calls, may_contain_sequence_constructor
		end

	XM_XSLT_PROCEDURE

	XM_XSLT_MODE_CONSTANTS

creation {XM_XSLT_NODE_FACTORY}

	make_style_element

feature {NONE} -- Initialization
		
	make_style_element (an_error_listener: XM_XSLT_ERROR_LISTENER; a_document: XM_XPATH_TREE_DOCUMENT;  a_parent: XM_XPATH_TREE_COMPOSITE_NODE;
		an_attribute_collection: XM_XPATH_ATTRIBUTE_COLLECTION; a_namespace_list:  DS_ARRAYED_LIST [INTEGER];
		a_name_code: INTEGER; a_sequence_number: INTEGER) is
			-- Establish invariant.
		do
			internal_fingerprint := -1 -- Not yet calculated, or not a named template
			Precursor (an_error_listener, a_document, a_parent, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number)
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
					internal_fingerprint := last_generated_name_code \\ bits_20
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

	prepare_attributes is
			-- Set the attribute list for the element.
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			a_name_code: INTEGER
			an_expanded_name, a_name_attribute, a_mode_attribute, a_priority_attribute, a_match_attribute, an_as_attribute: STRING
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
				end
			end
			if not any_compile_errors and then a_match_attribute = Void and then a_name_attribute = Void then
				report_compile_error ("xsl:template must have a name or match attribute (or both)")
			end
			if an_as_attribute /= Void then
				generate_sequence_type (an_as_attribute)
				if not any_compile_errors then
					required_type := last_generated_sequence_type
				end
			else
				create required_type.make_any_sequence
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
			check_top_level
			if match /= Void then type_check_pattern ("match", match) end
			mark_tail_calls
			validated := True
			create compiled_template.make -- so `{XM_XSLT_CALL_TEMPLATE}.compile' can forward-referenece to it
		end

	compile (an_executable: XM_XSLT_EXECUTABLE) is
			-- Compile `Current' to an excutable instruction.
		local
			a_sequence_instruction: XM_XSLT_SEQUENCE_INSTRUCTION
			a_rule_manager: XM_XSLT_RULE_MANAGER
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			a_mode: XM_XSLT_MODE
			a_name_code: INTEGER
			a_rule_value: XM_XSLT_RULE_VALUE
		do
			create a_sequence_instruction.make (an_executable, Void, required_type)
			compile_children (an_executable, a_sequence_instruction)
			is_stack_frame_needed := number_of_variables > 0
			compiled_template.initialize (a_sequence_instruction, is_stack_frame_needed, precedence, minimum_import_precedence, system_id, line_number)
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
					if a_name_code /= Default_mode and then  a_name_code /= All_modes then
						a_mode.set_name (shared_name_pool.display_name_from_name_code (a_name_code))
					end
					create a_rule_value.make (compiled_template)
					if is_priority_specified then
						a_rule_manager.set_handler (match, a_rule_value, a_mode, precedence, priority)
					else
						a_rule_manager.set_handler_with_default_priority (match, a_rule_value, a_mode, precedence)
					end
					a_cursor.forth
				end
			end
			principal_stylesheet.allocate_local_slots (number_of_variables)
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

feature {NONE} -- Implementation

	internal_fingerprint: INTEGER
			-- Used by `template_fingerprint'

	mode_name_codes: DS_ARRAYED_LIST [INTEGER]
			-- Name codes for the modes applicable to this template

	is_stack_frame_needed: BOOLEAN
			-- Is a stack fram needed?

	is_priority_specified: BOOLEAN
			-- has the priority been specified?

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
		do
			if a_mode_attribute = Void then
				create mode_name_codes.make (1)
				mode_name_codes.put_last (Default_mode)
			else
				if is_match_attribute_void then
					report_compile_error ("The mode attribute must be absent if the match attribute is absent")
				else
					create a_splitter.make
					mode_tokens := a_splitter.split (a_mode_attribute)
					if mode_tokens.count = 0 then
						report_compile_error ("The mode attribute must not be empty")
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
									report_compile_error ("mode='#all' cannot be combined with other modes")
								else
									mode_name_codes.put_last (All_modes)
								end
							else
								generate_name_code (a_mode)
								if last_generated_name_code = -1 then
									report_compile_error (error_message)
									a_cursor.go_after
								else
									mode_name_codes.put_last (last_generated_name_code)
								end
							end
							a_cursor.forth
						end
					end
				end
			end
		ensure
			mode_name_codes_not_void: not any_compile_errors implies mode_name_codes /= Void
		end

	prepare_name_attribute (a_name_attribute: STRING) is
			-- Prepare name attribute
		do
			if a_name_attribute /= Void then
				if is_qname (a_name_attribute) then
					generate_name_code (a_name_attribute)
					if last_generated_name_code = -1 then
						report_compile_error (error_message)
					else
						internal_fingerprint := fingerprint_from_name_code (last_generated_name_code)
					end
				else
					report_compile_error ("Template 'name' attribute must be a QName")
				end
			end
		end

	prepare_priority_attribute (a_priority_attribute: STRING; is_match_attribute_void: BOOLEAN) is
			-- Prepare priority attribute
		local
			a_message: STRING
			a_decimal_parser: MA_DECIMAL_TEXT_PARSER
		do
			if a_priority_attribute /= Void then
				is_priority_specified := True
				if is_match_attribute_void then
					report_compile_error ("The priority attribute must be absent if the match attribute is absent")
				else
					create a_decimal_parser
					a_decimal_parser.parse (a_priority_attribute)
					if not a_decimal_parser.error then
						priority := a_decimal_parser.last_decimal
					else
						a_message := STRING_.appended_string ("Invalid numeric value for priority (", a_priority_attribute)
						a_message := STRING_.appended_string (a_message, ")")
						report_compile_error (a_message)
					end
				end
			end
		end

invariant

	mode_name_codes_not_void: attributes_prepared and then not any_compile_errors implies mode_name_codes /= Void
	required_type: attributes_prepared and then not any_compile_errors implies required_type /= Void

end
