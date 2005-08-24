indexing

	description:

	"Objects that implement common behaviour between %
%xsl:variable xsl:param and xsl:with-param elements"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XSLT_GENERAL_VARIABLE

inherit

	XM_XSLT_STYLE_ELEMENT
		redefine
			validate, returned_item_type, may_contain_sequence_constructor
		end

	XM_XSLT_PROCEDURE

	XM_XPATH_ROLE

feature -- Access

	as_type: XM_XPATH_SEQUENCE_TYPE
			-- Type declared by "as" attribute

	select_expression: XM_XPATH_EXPRESSION
			-- Optional expression given by "select" attribute

	allows_required: BOOLEAN is
			-- Is the "required" attribute allowed?
		do
			Result := False
		end

	allows_value: BOOLEAN is
			-- Is the "select" attribute allowed?
		do
			Result := True
		end

	allows_tunnel: BOOLEAN 
			-- Is the "tunnel" attribute allowed to be "yes"?

	variable_name: STRING is
			-- Name of variable;
			-- For use in diagnostics - lexically, a QName
		do
			Result := attribute_value_by_name ("", Name_attribute)
		end
	
	variable_fingerprint: INTEGER is
			-- Fingerprint of the variable name;
			-- WARNING: This is NOT a pure function. It is implemented as a memo function.
		local
			a_name: STRING
		do

			-- If an expression has a forwards reference to this variable, `variable_fingerprint' can be
			--  called before `prepare_attributes' is called.
			-- We need to allow for this. But we'll  deal with any errors
			--  when we come round to processing this attribute, to avoid duplicate error messages

			-- TODO: this won't establish the required type in time to optimize an expression containing
			--  a forwards reference to the variable

			if cached_variable_fingerprint = -1 then
				a_name := attribute_value_by_name ("", Name_attribute)
				if a_name = Void then
					Result := -1 -- We will report the error later
				else
					STRING_.left_adjust (a_name)
					STRING_.right_adjust (a_name)
					generate_name_code (a_name)
					cached_variable_fingerprint := last_generated_name_code \\ bits_20
				end
			end
			Result := cached_variable_fingerprint
		ensure
			variable_fingerprint_nearly_positive: Result > -2	
		end


feature -- Status report

	may_contain_sequence_constructor: BOOLEAN is
			-- Is `Current' allowed to contain a sequence constructor?
		do
			Result := True
		end

	is_redundant_variable: BOOLEAN
			-- Is `Current' a redundant variable?

	is_global_variable: BOOLEAN is
			-- Is `Current' a global variable?
		do
			Result := is_top_level
		end
	
	is_required_parameter: BOOLEAN
			-- Is this a required parameter?

	is_tunnel_parameter: BOOLEAN
			-- Is this a tunnel parameter?

feature -- Status setting
	
	set_redundant_variable is
			-- Mark as a redundant variable
		require
			attributes_not_prepared: not attributes_prepared
		do
			is_redundant_variable := True
		ensure
			redundant_variable_set:	is_redundant_variable = True
		end

	prepare_attributes is
			-- Set the attribute list for the element.
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			a_name_code: INTEGER
			an_expanded_name, a_name_attribute, a_select_attribute, an_as_attribute, a_required_attribute, a_tunnel_attribute: STRING
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
					a_name_attribute := attribute_value_by_index (a_cursor.index)
					STRING_.left_adjust (a_name_attribute)
					STRING_.right_adjust (a_name_attribute)
				elseif STRING_.same_string (an_expanded_name, Select_attribute) then
					a_select_attribute := attribute_value_by_index (a_cursor.index)					
				elseif STRING_.same_string (an_expanded_name, As_attribute) then
					an_as_attribute := attribute_value_by_index (a_cursor.index)
				elseif STRING_.same_string (an_expanded_name, Required_attribute) and then allows_required then
					a_required_attribute := attribute_value_by_index (a_cursor.index)
					STRING_.left_adjust (a_required_attribute)
					STRING_.right_adjust (a_required_attribute)
				elseif STRING_.same_string (an_expanded_name, Tunnel_attribute) and then allows_tunnel then
					a_tunnel_attribute := attribute_value_by_index (a_cursor.index)
					STRING_.left_adjust (a_tunnel_attribute)
					STRING_.right_adjust (a_tunnel_attribute)
				else
					check_unknown_attribute (a_name_code)
				end
				a_cursor.forth
			end

			if a_name_attribute = Void then
				report_absence ("name")
			elseif not is_qname (a_name_attribute) then
				create an_error.make_from_string ("Name attribute must be a valid QName", Xpath_errors_uri, "XTSE0020", Static_error)
				report_compile_error (an_error)
			end
			if a_select_attribute /= Void then
				if not allows_value then
					create an_error.make_from_string ("Function parameters cannot have a default value", Xpath_errors_uri, "XTSE0760", Static_error)
					report_compile_error (an_error)
				else
					generate_expression (a_select_attribute)
					select_expression := last_generated_expression
					if select_expression.is_error then
						report_compile_error (select_expression.error_value)
					end
				end
			end
			prepare_attributes_2 (a_required_attribute, a_tunnel_attribute, an_as_attribute)
			attributes_prepared := True
		end

	validate is
			-- Check that the stylesheet element is valid.
		local
			a_message: STRING
			a_child_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			a_first_node: XM_XPATH_NODE
			an_error: XM_XPATH_ERROR_VALUE
		do
			if select_expression /= Void and then has_child_nodes then
				a_message := STRING_.concat ("An ", node_name)
				a_message := STRING_.appended_string (a_message, " element with a select attribute must be empty")
				create an_error.make_from_string (a_message, Xpath_errors_uri, "XTSE0010", Static_error)
				report_compile_error (an_error)
			else
				if as_type /= Void then check_against_required_type (as_type) end
				if not any_compile_errors then
					if select_expression = Void and then allows_value then
						is_text_only := True
						a_child_iterator := new_axis_iterator (Child_axis)
						a_child_iterator.start
						if a_child_iterator.after then
							if as_type = Void then
								create {XM_XPATH_STRING_VALUE} select_expression.make ("")
							elseif is_param then
								if not is_required_parameter then
									if as_type.cardinality_allows_zero then
										create {XM_XPATH_EMPTY_SEQUENCE} select_expression.make
									else
										
										-- The implicit default value () is not valid for the required type,
										--  so we treat it as if there is no default
										
										is_required_parameter := True 
									end
								else -- not an xsl:param
									if as_type.cardinality_allows_zero then
											create {XM_XPATH_EMPTY_SEQUENCE} select_expression.make
									else
										create an_error.make_from_string ("Default value () is not valid for the declared type", Xpath_errors_uri, "XTTE0570", Type_error)
										report_compile_error (an_error)
									end
								end
							end
						else -- at least one child node
							a_first_node := a_child_iterator.item
							a_child_iterator.forth
							if a_child_iterator.after then
								
								-- There is exactly one child node

								if a_first_node.node_type = Text_node then
									constant_text := a_first_node.string_value
								end
							end
							
							-- Determine if the temporary tree can only contain text nodes

							is_text_only := common_child_item_type = text_node_kind_test
						end
					end	
				end
			end
			if select_expression /= Void then
				type_check_expression ("select", select_expression)
				if select_expression.was_expression_replaced then
					select_expression := select_expression.replacement_expression
				end
			end
		end

	check_against_required_type (a_required_type: XM_XPATH_SEQUENCE_TYPE) is
			-- Check the expression conforms to `as_type'.
		require
			no_compile_errors: not any_compile_errors
			required_type_not_void: a_required_type /= Void
		local
			a_role: XM_XPATH_ROLE_LOCATOR
			a_type_checker: XM_XPATH_TYPE_CHECKER
		do
			create a_role.make (Variable_role, variable_name, 1, Xpath_errors_uri, "XTTE0570")
			if select_expression /= Void then
				create a_type_checker
				a_type_checker.static_type_check (static_context, select_expression, a_required_type, False, a_role)
				if a_type_checker.is_static_type_check_error	then
					report_compile_error (a_type_checker.static_type_check_error)
				else
					select_expression := a_type_checker.checked_expression
				end
			else
				-- do the check later
			end
		end

feature {XM_XSLT_STYLE_ELEMENT} -- Restricted

	returned_item_type: XM_XPATH_ITEM_TYPE is
			-- Type of item returned by this instruction;
			-- This is EMPTY for a variable: we are not
			--  interested in the type of the variable, but in what the xsl:variable constributes
			--  to the result of the sequence constructor it is part of.
		do
			Result := empty_item
		end

feature {NONE} -- Implementation

	cached_variable_fingerprint: INTEGER

	is_text_only: BOOLEAN
			-- Is the value of `Current' computed solely from text nodes?

	constant_text: STRING
			-- Value of `Current' when it has a single text node child

	initialize_instruction (an_executable: XM_XSLT_EXECUTABLE; a_variable: XM_XSLT_COMPILED_GENERAL_VARIABLE) is
			-- Initialize - common code called from the `compile' routine of all subclasses.
		require
			executable_not_void: an_executable /= Void
			variable_not_void: a_variable /= Void
		local
			a_document: XM_XSLT_COMPILED_DOCUMENT
			a_role: XM_XPATH_ROLE_LOCATOR
			a_type_checker: XM_XPATH_TYPE_CHECKER
		do
			a_variable.initialize_variable (select_expression, as_type, variable_fingerprint)
			a_variable.set_required_parameter (is_required_parameter)
			a_variable.set_tunnel_parameter (is_tunnel_parameter)

			-- Handle the "temporary tree" case by creating a Document sub-instruction
			-- to construct and return a document node.

			if has_child_nodes then
				if as_type = Void then
					compile_sequence_constructor (an_executable, new_axis_iterator (Child_axis), True)
					if last_generated_expression = Void then create {XM_XPATH_EMPTY_SEQUENCE} last_generated_expression.make end
					create a_document.make (an_executable, is_text_only, constant_text, base_uri, last_generated_expression)
					select_expression := a_document
					a_variable.set_selector (a_document)
				else
					compile_sequence_constructor (an_executable, new_axis_iterator (Child_axis), True)
					if last_generated_expression = Void then
						create {XM_XPATH_EMPTY_SEQUENCE} select_expression.make
					else
						select_expression := last_generated_expression
					end
					if as_type /= Void then
						select_expression.simplify
						if select_expression.was_expression_replaced then select_expression := select_expression.replacement_expression end
						if select_expression.is_error then
							report_compile_error (select_expression.error_value)
						else
							create a_role.make (Variable_role, variable_name, 1, Xpath_errors_uri, "XTTE0570")
							create a_type_checker
							a_type_checker.static_type_check (static_context, select_expression, as_type, False, a_role)
							if a_type_checker.is_static_type_check_error	then
								report_compile_error (a_type_checker.static_type_check_error)
							else
								select_expression := a_type_checker.checked_expression
							end
						end
						a_variable.set_selector (select_expression)
					end
				end
			end
			if is_global_variable then
				initialize_global_variable (a_variable.as_global_variable, an_executable)
			end
		end

	initialize_global_variable (a_global_variable: XM_XSLT_GLOBAL_VARIABLE; an_executable: XM_XSLT_EXECUTABLE) is
			-- Initialize global variable.
		require
			global_variable: is_global_variable and then a_global_variable /= Void
			executable_not_void: an_executable /= Void
		local
			an_expression: XM_XPATH_EXPRESSION
			a_trace_wrapper: XM_XSLT_TRACE_INSTRUCTION
		do
			
			if select_expression /= Void then
				select_expression.simplify
				if select_expression.was_expression_replaced then
					an_expression := select_expression.replacement_expression
				else
					an_expression := select_expression
				end
				if an_expression.is_error then
					report_compile_error (an_expression.error_value)
				else
					an_expression.check_static_type (static_context, any_node_test)
					if  not an_expression.is_error and then an_expression.was_expression_replaced then
						an_expression := an_expression.replacement_expression
					end
					if not an_expression.is_error then
						an_expression.optimize (static_context, any_node_test)
					end
					if  not an_expression.is_error and then an_expression.was_expression_replaced then
						an_expression := an_expression.replacement_expression
					end
					if an_expression.is_error then
						report_compile_error (an_expression.error_value)
					else
						if configuration.is_tracing then
							create a_trace_wrapper.make (an_expression, an_executable, Current)
							a_trace_wrapper.set_source_location (principal_stylesheet.module_number (system_id), line_number)
							an_expression := a_trace_wrapper
						end
						allocate_slots (an_expression, slot_manager)
						a_global_variable.set_slot_manager (slot_manager)
					end
				end
			end
			a_global_variable.set_selector (an_expression)
		end

	prepare_attributes_2 (a_required_attribute, a_tunnel_attribute, an_as_attribute: STRING) is
			-- Prepare attributes - stage 2.
		local
			an_error: XM_XPATH_ERROR_VALUE
		do
			if a_required_attribute /= Void then
				if STRING_.same_string (a_required_attribute, "yes") then
					is_required_parameter := True
				elseif STRING_.same_string (a_required_attribute, "no") then
					is_required_parameter := False
				else
					create an_error.make_from_string ("The attribute 'required' must be set to 'yes' or 'no'", Xpath_errors_uri, "XTSE0020", Static_error)
					report_compile_error (an_error)
				end
			end
			if a_tunnel_attribute /= Void then
				if STRING_.same_string (a_tunnel_attribute, "yes") then
					is_tunnel_parameter := True
				elseif STRING_.same_string (a_tunnel_attribute, "no") then
					is_tunnel_parameter := False
				else
					create an_error.make_from_string ("The attribute 'tunnel' must be set to 'yes' or 'no'", Xpath_errors_uri, "XTSE0020", Static_error)
					report_compile_error (an_error)
				end
			end
			if an_as_attribute /= Void then
				generate_sequence_type (an_as_attribute)
				as_type := last_generated_sequence_type
			end
		end

end
