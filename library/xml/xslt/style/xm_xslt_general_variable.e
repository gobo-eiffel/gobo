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
			validate, returned_item_type, may_contain_template_body
		end

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
					a_name.left_adjust
					a_name.right_adjust
					generate_name_code (a_name)
					cached_variable_fingerprint := last_generated_name_code \\ bits_20
				end
			end
			Result := cached_variable_fingerprint
		ensure
			variable_fingerprint_nearly_positive: Result > -2	
		end


feature -- Status report

	may_contain_template_body: BOOLEAN is
			-- Is `Current' allowed to contain a template-body?
		do
			Result := True
		end

	is_redundant_variable: BOOLEAN
			-- Is `Current' a redundant variable?

	is_global_variable: BOOLEAN
			-- Is `Current' a global variable?

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

	set_global_variable is
			-- Mark as a global variable
		require
			not_yet_validated: not validated
		do
			is_global_variable := True
		ensure
			global_variable_set:	is_global_variable = True
		end

	prepare_attributes is
			-- Set the attribute list for the element.
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			a_name_code: INTEGER
			an_expanded_name, a_name_attribute, a_select_attribute, an_as_attribute, a_required_attribute, a_tunnel_attribute: STRING
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
				if STRING_.same_string (an_expanded_name, Name_attribute) then
					a_name_attribute := attribute_value_by_index (a_cursor.index)
					a_name_attribute.left_adjust
					a_name_attribute.right_adjust
				elseif STRING_.same_string (an_expanded_name, Select_attribute) then
					a_select_attribute := attribute_value_by_index (a_cursor.index)					
				elseif STRING_.same_string (an_expanded_name, As_attribute) then
					an_as_attribute := attribute_value_by_index (a_cursor.index)
				elseif STRING_.same_string (an_expanded_name, Required_attribute) and then allows_required then
					a_required_attribute := attribute_value_by_index (a_cursor.index)
					a_required_attribute.left_adjust
					a_required_attribute.right_adjust
				elseif STRING_.same_string (an_expanded_name, Tunnel_attribute) and then allows_tunnel then
					a_tunnel_attribute := attribute_value_by_index (a_cursor.index)
					a_tunnel_attribute.left_adjust
					a_tunnel_attribute.right_adjust
				else
					check_unknown_attribute (a_name_code)
				end
				a_cursor.forth
			end

			if a_name_attribute = Void then
				report_absence ("name")
			elseif not is_qname (a_name_attribute) then
				report_compile_error ("Name attribute must be a valid QName")
			end
			if a_select_attribute /= Void then
				if not allows_value then
					report_compile_error ("Function parameters cannot have a default value")
				else
					generate_expression (a_select_attribute)
					select_expression := last_generated_expression
				end
			end
			if a_required_attribute /= Void then
				if STRING_.same_string (a_required_attribute, "yes") then
					is_required_parameter := True
				elseif STRING_.same_string (a_required_attribute, "no") then
					is_required_parameter := False
				else
					report_compile_error ("The attribute 'required' must be set to 'yes' or 'no'")
				end
			end
			if a_tunnel_attribute /= Void then
				if STRING_.same_string (a_tunnel_attribute, "yes") then
					is_tunnel := True
				elseif STRING_.same_string (a_tunnel_attribute, "no") then
					is_tunnel := False
				else
					report_compile_error ("The attribute 'tunnel' must be set to 'yes' or 'no'")
				end
			end
			if an_as_attribute /= Void then
				generate_sequence_type (an_as_attribute)
				as_type := last_generated_sequence_type
			end
			attributes_prepared := True
		end

	validate is
			-- Check that the stylesheet element is valid.
		local
			a_stylesheet: XM_XSLT_STYLESHEET
			a_message: STRING
			a_child_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			a_first_node: XM_XPATH_NODE
			a_parameter: XM_XSLT_PARAM
		do
			a_stylesheet ?= parent
			is_global := a_stylesheet /= Void
			if select_expression /= Void and then has_child_nodes then
				a_message := STRING_.appended_string ("An ", node_name)
				report_compile_error (STRING_.appended_string (a_message, " element with a select attribute must be empty"))
			else
				check_against_required_type
				if not any_compile_errors then
					if select_expression = Void and then allows_value then
						is_text_only := True
						a_child_iterator := new_axis_iterator (Child_axis)
						a_child_iterator.start
						if a_child_iterator.after then
							if as_type = Void then
								create {XM_XPATH_STRING_VALUE} select_expression.make ("")
							else
								a_parameter ?= Current
								if a_parameter /= Void then -- xsl:param
									if not is_required_parameter then
										if as_type.cardinality_allows_zero then
											create {XM_XPATH_EMPTY_SEQUENCE} select_expression.make
										else
											is_required_parameter := True
										end
									end
								else -- not an xsl:param
									if as_type.cardinality_allows_zero then
											create {XM_XPATH_EMPTY_SEQUENCE} select_expression.make
									else
										report_compile_error ("Default value () is not valid for the declared type")
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

	check_against_required_type is
			-- Check the expression conforms to `as_type'.
		require
			no_compile_errors: not any_compile_errors
		local
			a_role: XM_XPATH_ROLE_LOCATOR
			a_type_checker: XM_XPATH_TYPE_CHECKER
		do
			if as_type /= Void then
				create a_role.make (Variable_role, variable_name, 1)
				if select_expression /= Void then
					create a_type_checker
					a_type_checker.static_type_check (static_context, select_expression, as_type, False, a_role)
					if a_type_checker.is_static_type_check_error	then
						report_compile_error (a_type_checker.static_type_check_error_message)
					else
						select_expression := a_type_checker.checked_expression
					end
				else

					-- TODO: check the type of the instruction sequence statically

					todo ("check_against_required_type", True)
				end
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

	is_required_parameter: BOOLEAN
			-- Is this a required parameter?

	is_tunnel: BOOLEAN
			-- Is this a tunnel parameter?

	is_text_only: BOOLEAN
			-- Is the value of `Current' computed solely from text nodes?

	is_global: BOOLEAN
			-- Is `Current' a global variable/parameter?

	constant_text: STRING
			-- Value of `Current' when it has a single text node child

end
