indexing

	description:

		"xsl:function element nodes"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date  $"
	revision: "$Revision$"

class XM_XSLT_FUNCTION

inherit

	XM_XSLT_STYLE_ELEMENT
		redefine
			make_style_element, validate, may_contain_sequence_constructor,
			fixup_references
		end

	XM_XSLT_PROCEDURE

	XM_XPATH_ROLE

		-- A gexslt-specific extension attribute is implemented - gexslt:memo-function=yes|no

creation

	make_style_element

feature {NONE} -- Initialization
	
	make_style_element (an_error_listener: XM_XSLT_ERROR_LISTENER; a_document: XM_XPATH_TREE_DOCUMENT;  a_parent: XM_XPATH_TREE_COMPOSITE_NODE;
		an_attribute_collection: XM_XPATH_ATTRIBUTE_COLLECTION; a_namespace_list:  DS_ARRAYED_LIST [INTEGER];
		a_name_code: INTEGER; a_sequence_number: INTEGER) is
			-- Establish invariant.
		do
			number_of_arguments := -1
			internal_function_fingerprint := -1
			is_overriding := True
			create references.make_default
			Precursor (an_error_listener, a_document, a_parent, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number)
		end

feature -- Access

	references: DS_ARRAYED_LIST [XM_XSLT_USER_FUNCTION_CALL]
			-- References to `Current'

	arity: INTEGER is
			-- Arity of function;
			-- CAUTION: not pure - memo function
		require
			attributes_prepared: attributes_prepared
		local
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			finished: BOOLEAN
			a_param: XM_XSLT_PARAM
		do
			if number_of_arguments = -1 then
				number_of_arguments := 0
				from
					an_iterator := new_axis_iterator (Child_axis); an_iterator.start
				until
					finished or else an_iterator.after
				loop
					a_param ?= an_iterator.item
					if a_param /= Void then
						number_of_arguments := number_of_arguments + 1
						an_iterator.forth
					else
						finished := True
					end
				end
			end
			Result := number_of_arguments
		ensure
			positive_arity: Result >= 0
		end

	argument_types: DS_ARRAYED_LIST [XM_XPATH_SEQUENCE_TYPE] is
			-- Types for arguments
		require
			validated: validated
		local
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			a_param: XM_XSLT_PARAM
		do
			create Result.make (arity)
			from
				an_iterator := new_axis_iterator (Child_axis); an_iterator.start
			until
				an_iterator.after
			loop
				a_param ?= an_iterator.item
				if a_param /= Void then
					Result.put_last (a_param.required_type)
				end
				an_iterator.forth
			end
		end

	function_fingerprint: INTEGER is
			-- Fingerprint of function's QName;
			-- CAUTION: not pure - memo function
		do
			if internal_function_fingerprint = -1 then

				-- This is a forwards reference to the function.

				if static_context = Void then create static_context.make (Current) end
				prepare_attributes
				if any_compile_errors then
					internal_function_fingerprint := -1
				end
			end
			Result := internal_function_fingerprint
		ensure
			nearly_positive_fingerprint: Result >= -1
		end

feature -- Status report

	may_contain_sequence_constructor: BOOLEAN is
			-- Is `Current' allowed to contain a sequence constructor?
		do
			Result := True
		end

	is_overriding: BOOLEAN
			-- Was `override="yes"' specified (or defaulted)?

feature -- Element change

	register_reference (a_reference: XM_XSLT_USER_FUNCTION_CALL) is
			-- Register a function call reference for future fix-up.
		require
			reference_not_void: a_reference /= Void
		do
			references.force_last (a_reference)
		end

	fixup_references is
			-- Fix up references from XPath expressions.
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XSLT_USER_FUNCTION_CALL]
			a_function_call: XM_XSLT_USER_FUNCTION_CALL
		do
			from
				a_cursor := references.new_cursor; a_cursor.start
			until
				a_cursor.after
			loop
				a_function_call := a_cursor.item
				a_function_call.set_static_type (result_type)
				a_cursor.forth
			end
			Precursor
		end

	prepare_attributes is
			-- Set the attribute list for the element.
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			a_name_code: INTEGER
			an_expanded_name, an_as_attribute, an_override_attribute, a_memo_function_attribute: STRING
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
				if STRING_.same_string (an_expanded_name, Name_attribute) then
					function_name := attribute_value_by_index (a_cursor.index)
					if function_name.index_of (':', 2) = 0 then
						create an_error.make_from_string ("Xsl:function name must have a namespace prefix", "", "XT0740", Static_error)
						report_compile_error (an_error)
					else
						STRING_.left_adjust (function_name)
						STRING_.right_adjust (function_name)
						generate_name_code (function_name)
						internal_function_fingerprint := fingerprint_from_name_code (last_generated_name_code)
					end
				elseif STRING_.same_string (an_expanded_name, As_attribute) then
					an_as_attribute := attribute_value_by_index (a_cursor.index)
				elseif STRING_.same_string (an_expanded_name, Override_attribute) then
					an_override_attribute := attribute_value_by_index (a_cursor.index)
					STRING_.left_adjust (an_override_attribute)
					STRING_.right_adjust (an_override_attribute)
					if STRING_.same_string (an_override_attribute, "yes") then
						is_overriding := True
					elseif STRING_.same_string (an_override_attribute, "no") then
						is_overriding := False
					else
						create an_error.make_from_string ("Xsl:function override attribute must be 'yes' or 'no'", "", "XT0020", Static_error)
						report_compile_error (an_error)
					end
				elseif STRING_.same_string (an_expanded_name, Gexslt_memo_function_attribute) then
					debug ("XSLT memo function")
						std.error.put_string ("gexslt:memo-function found%N")
					end
					a_memo_function_attribute := attribute_value_by_index (a_cursor.index)
					STRING_.left_adjust (a_memo_function_attribute)
					STRING_.right_adjust (a_memo_function_attribute)
					if STRING_.same_string (a_memo_function_attribute, "yes") then
						is_memo_function := True
					elseif STRING_.same_string (a_memo_function_attribute, "no") then
						is_memo_function := False
					else
						create an_error.make_from_string ("Xsl:function memo-function extension attribute must be 'yes' or 'no'", "", "XT0020", Static_error)
						report_compile_error (an_error)
					end
				else
					check_unknown_attribute (a_name_code)
				end
				a_cursor.forth
			end

			if function_name = Void then
				report_absence ("name")
			end
			if an_as_attribute /= Void then
				generate_sequence_type (an_as_attribute)
				result_type := last_generated_sequence_type
			else
				create result_type.make_any_sequence
			end
			attributes_prepared := True
		end

	validate is
			-- Check that the stylesheet element is valid.
			-- This is called once for each element, after the entire tree has been built.
			-- As well as validation, it can perform first-time initialisation.
		local
			an_arity: INTEGER
			a_root: XM_XSLT_STYLESHEET
			a_cursor: DS_BILINKED_LIST_CURSOR [XM_XSLT_STYLE_ELEMENT]
			a_function: XM_XSLT_FUNCTION
			an_error: XM_XPATH_ERROR_VALUE
		do
			check_top_level
			an_arity := arity

			-- Check that this function is not a duplicate of another.

			from
				a_root := principal_stylesheet
				a_cursor := a_root.top_level_elements.new_cursor; a_cursor.finish
			variant
				a_cursor.index
			until
				a_cursor.before
			loop
				a_function ?= a_cursor.item
				if a_function /= Void and then a_function /= Current
					and then a_function.arity = an_arity
					and then a_function.function_fingerprint = function_fingerprint
					and then a_function.precedence = precedence then
					create an_error.make_from_string (STRING_.concat ("Duplicate function declaration for ", function_name), "", "XT0770", Static_error)
					report_compile_error (an_error)
					a_cursor.go_before
				else
					a_cursor.back
				end
			end
			debug ("XSLT memo function")
				if is_memo_function then
					std.error.put_string ("Memo function:")
					std.error.put_string (function_name)
					std.error.put_new_line
				end
			end
			validated := True
		end

	compile (an_executable: XM_XSLT_EXECUTABLE) is
			-- Compile `Current' to an excutable instruction. 
		do
			principal_stylesheet.allocate_local_slots (number_of_variables)
			if	is_compilable_as_expression then
				compile_as_expression (an_executable)
			else
				compile_as_template (an_executable)
			end
			last_generated_instruction := Void
		end

feature {NONE} -- Implementation

	internal_function_fingerprint: INTEGER
			-- Fingerprint of function's QName (-1 = forward reference)

	number_of_arguments: INTEGER
			-- Number of arguments (-1 = not yet known)

	function_name: STRING
			-- QName of function

	result_type: XM_XPATH_SEQUENCE_TYPE
			-- Type of result

	is_memo_function: BOOLEAN
			-- Is this function a memo function?

	is_compilable_as_expression: BOOLEAN is
			-- Is `Current' compilable as a single expression?
			-- This is true if it is not a memo function, and
			--  the body consists (after the xsl:param elements) of a sequence
			--  of xsl:variable instructions followed by an xsl:sequence instruction, all
			--  satisfying certain conditions.
		local
			a_state: INTEGER
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			a_node: XM_XPATH_NODE
			a_variable: XM_XSLT_VARIABLE
			a_param: XM_XSLT_PARAM
			a_sequence: XM_XSLT_SEQUENCE
		do
			if not is_memo_function then
				from
					Result := True
					an_iterator := new_axis_iterator (Child_axis); an_iterator.start
				until
					Result = False or else an_iterator.after
				loop
					a_node := an_iterator.item
					if a_node.node_type = Text_node then
						Result := False
					else
						a_param ?= a_node
						if a_param /= Void and then a_state = 0 then
							-- OK
						else
							a_variable ?= a_node
							if a_variable /= Void and then a_state < 2 then
								if a_node.has_child_nodes then
									Result := False
								end
								a_state := 1
							else
								a_sequence ?= a_node
								if a_sequence /= Void and then a_state < 2 then
									if a_node.has_child_nodes then
										Result := False
									end
									a_state := 2
								else
									Result := False
								end
							end
						end
					end
					an_iterator.forth
				end
			end
		end

	compile_as_expression (an_executable: XM_XSLT_EXECUTABLE) is
			-- Compile as a single expression.
			-- This involves recursively translating xsl:variable declarations
			--  into let expressions, with the action part of the
			--  let expression containing the rest of the function body.
			-- The XM_XSLT_COMPILED_USER_FUNCTION that is created will be linked
			--  from all calls to this function, so nothing else needs to be
			--  done with the result. If there are no calls to it, the
			--  compiled function will be garbage-collected away.
		require
			executable_not_void: an_executable /= Void
			compilable_as_expression: is_compilable_as_expression
		local
			a_body: XM_XSLT_SEQUENCE_INSTRUCTION
			some_children: DS_ARRAYED_LIST [XM_XSLT_INSTRUCTION]
			an_expression: XM_XPATH_EXPRESSION
			a_role: XM_XPATH_ROLE_LOCATOR
			a_type_checker: XM_XPATH_TYPE_CHECKER
			a_user_function: XM_XSLT_COMPILED_USER_FUNCTION
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XSLT_INSTRUCTION]
			an_error: XM_XPATH_ERROR_VALUE
		do
			debug ("XSLT memo function")
				if is_memo_function then
					std.error.put_string ("ATTENTION! BUG! memo function compiled as expression%N")
				end
			end
			create a_body.make (an_executable, Void, result_type)
			compile_children (an_executable, a_body)
			create some_children.make (last_generated_instruction_list.count)
			from
				a_cursor := last_generated_instruction_list.new_cursor; a_cursor.start
			variant
				last_generated_instruction_list.count + 1 - a_cursor.index
			until
				a_cursor.after
			loop
				some_children.put_last (a_cursor.item)
				a_cursor.forth
			end
			an_expression := converted_expression (some_children, 1)
			if result_type /= Void then
				create a_role.make (Function_result_role, function_name, 1)
				create a_type_checker
				a_type_checker.static_type_check (Void, an_expression, result_type, False, a_role)
				if a_type_checker.is_static_type_check_error then
					create an_error.make_from_string(a_type_checker.static_type_check_error_message, Xpath_errors_uri, "XP0004", Type_error)
					report_compile_error (an_error)
				else
					an_expression := a_type_checker.checked_expression
				end
			end
			create a_user_function.make (an_expression, function_name, system_id, line_number)
			fixup_instruction (a_user_function)
			set_parameter_definitions (a_user_function)
		end

	converted_expression (some_children: DS_ARRAYED_LIST [XM_XSLT_INSTRUCTION]; a_position: INTEGER): XM_XPATH_EXPRESSION is
			-- Recursively process one xsl:variable instruction and create one let expression.
			-- The variable declared in the xsl:variable becomes the range variable of the let expression,
			--  and the rest of the instruction sequence becomes the action part of the let expression.
		require
			instructions_not_void: some_children /= Void
			position_in_range: a_position > 0 and then a_position <= some_children.count + 1
		local
			a_starting_instruction: XM_XSLT_INSTRUCTION
			a_trace_instruction: XM_XSLT_TRACE_INSTRUCTION
			an_expression: XM_XPATH_EXPRESSION
			an_expression_instruction: XM_XSLT_EXPRESSION_INSTRUCTION
			a_variable: XM_XSLT_COMPILED_VARIABLE
			a_sequence: XM_XSLT_SEQUENCE_INSTRUCTION
			a_let_expression: XM_XPATH_LET_EXPRESSION
			a_range_variable: XM_XPATH_RANGE_VARIABLE_DECLARATION
		do
			if some_children.count < a_position then
				create {XM_XPATH_EMPTY_SEQUENCE} Result.make
			else
				a_starting_instruction := some_children.item (a_position)
				a_trace_instruction ?= a_starting_instruction
				if a_trace_instruction /= Void then
					a_starting_instruction := a_trace_instruction.children.item (1)
				end
				an_expression_instruction ?= a_starting_instruction
				if an_expression_instruction /= Void then
					Result := an_expression_instruction
				else
					a_variable ?= a_starting_instruction
					if a_variable /= Void then
						create a_range_variable.make (a_variable.variable_name, a_variable.variable_fingerprint, a_variable.required_type)
						an_expression := converted_expression (some_children, a_position + 1)
						create a_let_expression.make (a_range_variable, a_variable.select_expression, an_expression)
						a_let_expression.set_slot_number (a_variable.slot_number)
						Result := a_let_expression
					else
						a_sequence ?= a_starting_instruction
						if a_sequence /= Void then
							an_expression := a_sequence.select_expression
							an_expression.mark_tail_function_calls
							Result := an_expression
						else
							check
								logic_error: False
							end
						end
					end
				end
			end
		ensure
			converted_expression_not_void: Result /= Void
		end

	compile_as_template (an_executable: XM_XSLT_EXECUTABLE) is
			-- Compile as sequence of instructions.
			-- This is done when the simpler XM_XSLT_COMPILED_USER_FUNCTION cannot be used.
			-- The compiled function is linked to all the calls on the function.
		require
			executable_not_void: an_executable /= Void
		local
			a_body: XM_XSLT_SEQUENCE_INSTRUCTION
			some_children: DS_ARRAYED_LIST [XM_XSLT_INSTRUCTION]
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XSLT_INSTRUCTION]
			a_function: XM_XSLT_FUNCTION_INSTRUCTION
		do
			debug ("XSLT memo function")
				if is_memo_function then
					std.error.put_string ("Compiling as memo function%N")
				end
			end
			create a_body.make (an_executable, Void, result_type)
			compile_children (an_executable, a_body)
			create some_children.make (last_generated_instruction_list.count)
			from
				a_cursor := last_generated_instruction_list.new_cursor; a_cursor.start
			variant
				last_generated_instruction_list.count + 1 - a_cursor.index
			until
				a_cursor.after
			loop
				some_children.put_last (a_cursor.item)
				a_cursor.forth
			end
			a_body.set_children (some_children)
			create a_function.make (a_body, function_name, base_uri, line_number, is_memo_function)
			fixup_instruction (a_function)
			set_parameter_definitions (a_function)
		end

	fixup_instruction (a_user_function: XM_XSLT_CALLABLE_FUNCTION) is
			-- Fix-up all references.
		require
			user_function_not_void: a_user_function /= Void
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XSLT_USER_FUNCTION_CALL]
		do
			from
				a_cursor := references.new_cursor; a_cursor.start
			variant
				references.count + 1 - a_cursor.index
			until
				any_compile_errors or else a_cursor.after
			loop
				a_cursor.item.set_function (Current, a_user_function)
				if a_cursor.item.is_type_error then
					report_compile_error (a_cursor.item.error_value)
				end
				a_cursor.forth
			end
		end

	set_parameter_definitions (a_user_function: XM_XSLT_CALLABLE_FUNCTION) is
			-- Compile and save the xsl:param definitions.
		require
			user_function_not_void: a_user_function /= Void
		local
			some_parameters: DS_ARRAYED_LIST [XM_XSLT_USER_FUNCTION_PARAMETER]
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			a_param: XM_XSLT_PARAM
			a_function_param: XM_XSLT_USER_FUNCTION_PARAMETER
		do
			create some_parameters.make_default
			a_user_function.set_parameter_definitions (some_parameters)
			from
				an_iterator := new_axis_iterator (Child_axis); an_iterator.start
			until
				an_iterator.after
			loop
				a_param ?= an_iterator.item
				if a_param /= Void then
					create a_function_param.make (a_param.required_type, a_param.slot_number, a_param.variable_name)
					a_param.fixup_binding (a_function_param)
					a_function_param.set_reference_count (a_param.references)
				end
				an_iterator.forth
			end
		end
			
invariant

	references_not_void: references /= Void

end	

