indexing

	description:

		"Objects that represent the compiled form of XSLT variables and parameters"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XSLT_COMPILED_GENERAL_VARIABLE

inherit

	XM_XSLT_INSTRUCTION

feature -- Access

	select_expression: XM_XPATH_EXPRESSION
			-- Select expresion

	required_type: XM_XPATH_SEQUENCE_TYPE
			-- Required type

	variable_fingerprint: INTEGER
			-- Fingerprint of variable name

	instruction_name: STRING
			-- Name of instruction, for diagnostics
	
feature -- Status report

	is_global_variable: BOOLEAN
			-- Is `Current' a global variable?

	is_required_parameter: BOOLEAN
			-- Is `Current' a required paramter?

	is_tunnel_parameter: BOOLEAN
			-- Is `Current' a tunnel paramter?

	contains_local_variables: BOOLEAN
			-- Does `Current' contain any local variables?
	
feature -- Status setting

	set_selector (a_select_expression: XM_XPATH_EXPRESSION) is
			-- Set `select_expression'.
		require
			select_expression_not_void: a_select_expression /= Void
		do
			select_expression := a_select_expression
		ensure
			set: select_expression = a_select_expression
		end

	set_global_variable (is_global: BOOLEAN) is
			-- Set global/local variable
		do
			is_global_variable := is_global
		ensure
			set: is_global_variable = is_global
		end

	set_required_parameter (is_required: BOOLEAN) is
			-- Set required/optional parameter.
		do
			is_required_parameter := is_required
		ensure
			set: is_required_parameter = is_required
		end

	set_tunnel_parameter (is_tunnel: BOOLEAN) is
			-- Set tunnel/optional parameter.
		do
			is_tunnel_parameter := is_tunnel
		ensure
			set: is_tunnel_parameter = is_tunnel
		end
	
	set_contains_locals (any_locals: BOOLEAN) is
			-- Set `contains_local_variables'.
		do
			contains_local_variables := any_locals
		ensure
			set: contains_local_variables = any_locals
		end
	
feature -- Element change

	initialize (a_select_expression: XM_XPATH_EXPRESSION; a_required_type: XM_XPATH_SEQUENCE_TYPE; a_fingerprint: INTEGER) is
			-- Set initial values.
		do
			select_expression := a_select_expression
			required_type := a_required_type
			variable_fingerprint := a_fingerprint
		ensure
			select_expression: select_expression = a_select_expression
			required_type: required_type = a_required_type
			variable_fingerprint: variable_fingerprint = a_fingerprint
		end

	set_required_type (a_required_type: XM_XPATH_SEQUENCE_TYPE) is
			-- Set `required_type'.
		do
			required_type := a_required_type
		ensure
			set: required_type = a_required_type
		end
			
invariant

	required_parameter: not (is_required_parameter and then (is_global_variable or else is_tunnel_parameter))
	tunnel_parameter: not (is_tunnel_parameter and then (is_global_variable or else is_required_parameter))
	global_variable: not (is_global_variable and then (is_required_parameter or else is_tunnel_parameter))

end

