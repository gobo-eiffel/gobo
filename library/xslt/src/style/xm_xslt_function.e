note

	description:

		"xsl:function element nodes"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004-2018, Colin Adams and others"
	license: "MIT License"

class XM_XSLT_FUNCTION

inherit

	XM_XSLT_STYLE_ELEMENT
		redefine
			make_style_element, validate, may_contain_sequence_constructor,
			fixup_references, is_permitted_child, is_xslt_function, as_xslt_function
		end

	XM_XSLT_PROCEDURE

	XM_XPATH_ROLE

		-- A gexslt-specific extension attribute is implemented - gexslt:memo-function=yes|no

create

	make_style_element

feature {NONE} -- Initialization

	make_style_element (an_error_listener: XM_XSLT_ERROR_LISTENER; a_document: XM_XPATH_TREE_DOCUMENT;  a_parent: detachable XM_XPATH_TREE_COMPOSITE_NODE;
		an_attribute_collection: detachable XM_XPATH_ATTRIBUTE_COLLECTION; a_namespace_list: detachable DS_ARRAYED_LIST [INTEGER];
		a_name_code: INTEGER; a_sequence_number: INTEGER; a_configuration: like configuration)
			-- Establish invariant.
		do
			internal_function_fingerprint := -1
			is_overriding := True
			create references.make_default
			create slot_manager.make
			Precursor (an_error_listener, a_document, a_parent, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, a_configuration)
		end

feature -- Access

	references: DS_ARRAYED_LIST [XM_XSLT_USER_FUNCTION_CALL]
			-- References to `Current'

	compiled_function: detachable XM_XSLT_COMPILED_USER_FUNCTION
			-- Compiled version of `Current'

	function_name: detachable STRING
			-- QName of function

	arity: INTEGER
			-- Arity of function;
		local
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			finished: BOOLEAN
		do
			from
				an_iterator := new_axis_iterator (Child_axis); an_iterator.start
			until
				finished or else an_iterator.after
			loop
				if attached {XM_XSLT_PARAM} an_iterator.item as a_param then
					Result := Result + 1
					an_iterator.forth
				else
					finished := True
				end
			end
		ensure
			positive_arity: Result >= 0
		end

	argument_types: DS_ARRAYED_LIST [XM_XPATH_SEQUENCE_TYPE]
			-- Types for arguments
		require
			validated: validated
		local
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
		do
			create Result.make (arity)
			from
				an_iterator := new_axis_iterator (Child_axis); an_iterator.start
			until
				an_iterator.after
			loop
				if attached {XM_XSLT_PARAM} an_iterator.item as a_param then
					Result.put_last (a_param.required_type)
				end
				an_iterator.forth
			end
		end

	function_fingerprint: INTEGER
			-- Fingerprint of function's QName;
			-- CAUTION: not pure - memo function
		do
			if internal_function_fingerprint = -1 then

				-- This is a forwards reference to the function.

				if static_context = Void then create static_context.make (Current, configuration) end
				if not attributes_prepared then prepare_attributes end
				if any_compile_errors then
					internal_function_fingerprint := -1
				end
			end
			Result := internal_function_fingerprint
		ensure
			nearly_positive_fingerprint: Result >= -1
		end

feature -- Status report

	may_contain_sequence_constructor: BOOLEAN
			-- Is `Current' allowed to contain a sequence constructor?
		do
			Result := True
		end

	is_permitted_child (a_style_element: XM_XSLT_STYLE_ELEMENT): BOOLEAN
			-- Is `a_style_element' a permitted child of `Current'?
		do
			Result := a_style_element.is_param
		end

	is_overriding: BOOLEAN
			-- Was `override="yes"' specified (or defaulted)?

feature -- Element change

	register_reference (a_reference: XM_XSLT_USER_FUNCTION_CALL)
			-- Register a function call reference for future fix-up.
		require
			reference_not_void: a_reference /= Void
		do
			references.force_last (a_reference)
		end

	fixup_references
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

	prepare_attributes
			-- Set the attribute list for the element.
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			a_name_code: INTEGER
			an_expanded_name, an_as_attribute, an_override_attribute, a_memo_function_attribute: detachable STRING
			an_error: XM_XPATH_ERROR_VALUE
			l_function_name: like function_name
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
					if STRING_.same_string (an_expanded_name, Name_attribute) then
						l_function_name := attribute_value_by_index (a_cursor.index)
						STRING_.left_adjust (l_function_name)
						STRING_.right_adjust (l_function_name)
						function_name := l_function_name
						if l_function_name.index_of (':', 2) = 0 then
							create an_error.make_from_string ("Xsl:function name must have a namespace prefix", Xpath_errors_uri, "XTSE0740", Static_error)
							report_compile_error (an_error)
						elseif not is_qname (l_function_name) then
							create an_error.make_from_string ("Xsl:function name must be a lexical QName", Xpath_errors_uri, "XTSE0020", Static_error)
							report_compile_error (an_error)
						else
							generate_name_code (l_function_name)
							internal_function_fingerprint := fingerprint_from_name_code (last_generated_name_code)
							if internal_function_fingerprint = -1 then
								-- Must be because the namespace is reserved
								create an_error.make_from_string ("Xsl:function name may not use a reserved namespace", Xpath_errors_uri, "XTSE0080", Static_error)
								report_compile_error (an_error)
							end
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
							create an_error.make_from_string ("Xsl:function override attribute must be 'yes' or 'no'", Xpath_errors_uri, "XTSE0020", Static_error)
							report_compile_error (an_error)
						end
					elseif STRING_.same_string (an_expanded_name, Gexslt_memo_function_attribute) then
						a_memo_function_attribute := attribute_value_by_index (a_cursor.index)
						STRING_.left_adjust (a_memo_function_attribute)
						STRING_.right_adjust (a_memo_function_attribute)
						if STRING_.same_string (a_memo_function_attribute, "yes") then
							is_memo_function := False
							report_compile_warning ("Gexslt:memo-function is no longer supported. Use the gexslt:function extension instruction instead.%NNo memoization will occur")
						elseif STRING_.same_string (a_memo_function_attribute, "no") then
							is_memo_function := False
							report_compile_warning ("Gexslt:memo-function is no longer supported. Use the gexslt:function extension instruction instead.%NNo memoization will occur")
						else
							create an_error.make_from_string ("Xsl:function memo-function extension attribute must be 'yes' or 'no' (but is obsolete - se the gexslt:function extension instruction instead).",
							Xpath_errors_uri, "XTSE0020", Static_error)
							report_compile_error (an_error)
						end
					else
						check_unknown_attribute (a_name_code)
					end
					a_cursor.forth
				variant
					l_attribute_collection.number_of_attributes + 1 - a_cursor.index
				end
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

	validate
			-- Check that the stylesheet element is valid.
			-- This is called once for each element, after the entire tree has been built.
			-- As well as validation, it can perform first-time initialisation.
		local
			an_arity: INTEGER
			a_root: XM_XSLT_STYLESHEET
			a_cursor: DS_BILINKED_LIST_CURSOR [XM_XSLT_STYLE_ELEMENT]
			an_error: XM_XPATH_ERROR_VALUE
		do
			check_top_level (Void)
			an_arity := arity

			-- Check that this function is not a duplicate of another.

			from
				check attached principal_stylesheet as l_principal_stylesheet then
					a_root := l_principal_stylesheet
				end
				check attached a_root.top_level_elements as l_top_level_elements then
					a_cursor := l_top_level_elements.new_cursor
				end
				a_cursor.finish
			until
				a_cursor.before
			loop
				if a_cursor.item.is_xslt_function and then a_cursor.item.as_xslt_function /= Current
					and then a_cursor.item.as_xslt_function.arity = an_arity
					and then a_cursor.item.as_xslt_function.function_fingerprint = function_fingerprint
					and then a_cursor.item.as_xslt_function.precedence = precedence then
					check attached function_name as l_function_name then
						create an_error.make_from_string (STRING_.concat ("Duplicate function declaration for ", l_function_name), Xpath_errors_uri, "XTSE0770", Static_error)
					end
					report_compile_error (an_error)
					a_cursor.go_before
				else
					a_cursor.back
				end
			variant
				a_cursor.index
			end
			validated := True
		end

	compile (an_executable: XM_XSLT_EXECUTABLE)
			-- Compile `Current' to an excutable instruction.
		local
			l_body: detachable XM_XPATH_EXPRESSION
			l_role: XM_XPATH_ROLE_LOCATOR
			l_type_checker: XM_XPATH_TYPE_CHECKER
			l_trace_wrapper: XM_XSLT_TRACE_INSTRUCTION
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
			l_compiled_function: like compiled_function
		do

			-- Compile the function into a XM_XSLT_COMPILED_USER_FUNCTION, which treats the function
			--  body as a single XPath expression. This involves recursively translating
			--  xsl:variable declarations into let expressions, with the action part of the
			--  let expression containing the rest of the function body.
			-- The XM_XSLT_COMPILED_USER_FUNCTION that is created will be linked from all calls to
			--  this function, so nothing else needs to be done with the result. If there are
			--  no calls to it, the compiled function will be garbage-collected away.

			compile_sequence_constructor (an_executable, new_axis_iterator (Child_axis), False)
			l_body := last_generated_expression
			if l_body = Void then
				create {XM_XPATH_EMPTY_SEQUENCE} l_body.make
			end
			create l_replacement.make (Void)
			l_body.simplify (l_replacement)
			check postcondition_of_simplify: attached l_replacement.item as l_replacement_item then
				l_body := l_replacement_item
			end
			l_replacement.put (Void)
			check attached static_context as l_static_context then
				l_body.check_static_type (l_replacement, l_static_context, Void)
			end
			check postcondition_of_check_static_type: attached l_replacement.item as l_replacement_item then
				l_body := l_replacement_item
			end
			if attached l_body.error_value as l_error_value then
				check is_error: l_body.is_error end
				report_compile_error (l_error_value)
			else
				l_replacement.put (Void)
				check attached static_context as l_static_context then
					l_body.optimize (l_replacement, l_static_context, Void)
				end
					check postcondition_of_optimize: attached l_replacement.item as l_replacement_item then
					l_body := l_replacement_item
				end
				if attached l_body.error_value as l_error_value then
					check is_error: l_body.is_error end
					report_compile_error (l_error_value)
				else
					if attached result_type as l_result_type then
						check attached function_name as l_function_name then
							create l_role.make (Function_result_role, l_function_name, 1, Xpath_errors_uri, "XTTE0780")
						end
						create l_type_checker
						l_type_checker.static_type_check (static_context, l_body, l_result_type, False, l_role)
						if l_type_checker.is_static_type_check_error then
							check postcondition_of_static_type_check: attached l_type_checker.static_type_check_error as l_static_type_check_error then
								report_compile_error (l_static_type_check_error)
							end
						else
							check postcondition_of_static_type_check: attached l_type_checker.checked_expression as l_checked_expression then
								l_body := l_checked_expression
							end
						end
					end
					if configuration.is_tracing then
						create l_trace_wrapper.make (l_body, an_executable, Current)
						check attached principal_stylesheet as l_principal_stylesheet then
							l_trace_wrapper.set_source_location (l_principal_stylesheet.module_number (system_id), line_number)
						end
						l_body := l_trace_wrapper
					end
					allocate_slots (l_body, slot_manager)
					l_body.mark_tail_function_calls
					check
						attached function_name as l_function_name
						attached result_type as l_result_type
					then
						create l_compiled_function.make (an_executable, l_body, l_function_name, function_fingerprint, arity, system_id,
							line_number, slot_manager, l_result_type, is_memo_function)
						compiled_function := l_compiled_function
						set_parameter_definitions (l_compiled_function)
						fixup_instruction (l_compiled_function)
						if is_explaining then
							std.error.put_string ("Optimized expression tree for function '")
							std.error.put_string (l_function_name)
							std.error.put_string ("' at line ")
							std.error.put_string (line_number.out)
							std.error.put_string (" in ")
							std.error.put_string (system_id)
							std.error.put_new_line
							if not attached l_body.error_value as l_error_value then
								std.error.put_string ("Static type: ")
								std.error.put_string (l_body.item_type.conventional_name)
								std.error.put_string (l_body.occurrence_indicator)
								std.error.put_new_line
								std.error.put_string ("Optimized expression tree:%N")
								l_body.display (10)
							else
								check is_error: l_body.is_error end
								std.error.put_string ("Function body is in error%N")
								std.error.put_string (l_error_value.error_message)
								std.error.put_new_line
							end
						end
					end
				end
			end
		end

feature -- Conversion

	is_xslt_function: BOOLEAN
			-- Is `Current' an xsl:function?
		do
			Result := True
		end

	as_xslt_function: XM_XSLT_FUNCTION
			-- `Current' seen as an xsl:function
		do
			Result := Current
		end

feature {NONE} -- Implementation

	internal_function_fingerprint: INTEGER
			-- Fingerprint of function's QName (-1 = forward reference)

	result_type: detachable XM_XPATH_SEQUENCE_TYPE
			-- Type of result

	is_memo_function: BOOLEAN
			-- Is this function a memo function? (From: gexslt extension attribute)

	fixup_instruction (a_user_function: XM_XSLT_COMPILED_USER_FUNCTION)
			-- Fix-up all references.
		require
			user_function_not_void: a_user_function /= Void
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XSLT_USER_FUNCTION_CALL]
		do
			from
				a_cursor := references.new_cursor; a_cursor.start
			until
				any_compile_errors or else a_cursor.after
			loop
				a_cursor.item.set_function (Current, a_user_function, static_context)
				if attached a_cursor.item.error_value as l_error_value then
					check is_type_error: a_cursor.item.is_type_error end
					report_compile_error (l_error_value)
				end
				a_cursor.forth
			variant
				references.count + 1 - a_cursor.index
			end
		end

	set_parameter_definitions (a_user_function: XM_XSLT_COMPILED_USER_FUNCTION)
			-- Compile and save the xsl:param definitions.
		require
			user_function_not_void: a_user_function /= Void
		local
			some_parameters: DS_ARRAYED_LIST [XM_XSLT_USER_FUNCTION_PARAMETER]
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			a_function_param: XM_XSLT_USER_FUNCTION_PARAMETER
		do
			create some_parameters.make (arity)
			a_user_function.set_parameter_definitions (some_parameters)
			from
				an_iterator := new_axis_iterator (Child_axis); an_iterator.start
			until
				an_iterator.after
			loop
				if attached {XM_XSLT_PARAM} an_iterator.item as a_param then
					create a_function_param.make (a_param.required_type, a_param.slot_number, a_param.variable_name)
					a_param.fixup_binding (a_function_param)
					a_function_param.set_reference_count (a_param.references)
					some_parameters.put_last (a_function_param)
				end
				an_iterator.forth
			end
		end

invariant

	references_not_void: references /= Void

end

