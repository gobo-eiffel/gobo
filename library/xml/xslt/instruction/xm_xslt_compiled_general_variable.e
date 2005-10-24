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
		redefine
			item_type, compute_cardinality, evaluate_item, create_iterator,
			sub_expressions, promote_instruction
		end

	XM_XPATH_BINDING

	XM_XPATH_SHARED_NO_NODE_TEST
		export {NONE} all end

	XM_XPATH_ROLE

	XM_XPATH_VARIABLE_DECLARATION_ROUTINES

feature -- Access

	select_expression: XM_XPATH_EXPRESSION
			-- Select expresion

	required_type: XM_XPATH_SEQUENCE_TYPE
			-- Required type

	variable_fingerprint: INTEGER
			-- Fingerprint of variable name

	slot_number: INTEGER
			-- Slot number within local stack frame or all global variables

	item_type: XM_XPATH_ITEM_TYPE is
			-- Type of items yielded
		do
			Result := empty_item
		end

	sub_expressions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION] is
			-- Immediate sub-expressions of `Current'
		do
			create Result.make (1)
			Result.set_equality_tester (expression_tester)
			if select_expression /= Void then
				Result.put (select_expression, 1)
			end
		end

feature -- Status report

	is_required_parameter: BOOLEAN
			-- Is `Current' a required paramter?

	is_tunnel_parameter: BOOLEAN
			-- Is `Current' a tunnel paramter?

	is_global: BOOLEAN is
			-- Is binding global or local?
		do
			Result := False
		end

feature -- Status setting

	set_selector (a_select_expression: XM_XPATH_EXPRESSION) is
			-- Set `select_expression'.
		do
			select_expression := a_select_expression
			if select_expression /= Void then
				adopt_child_expression (select_expression)
			end
		ensure
			set: select_expression = a_select_expression
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

feature -- Optimization

	simplify is
			-- Perform context-independent static optimizations
		do
			if select_expression /= Void then
				select_expression.simplify
				if select_expression.was_expression_replaced then
					set_selector (select_expression.replacement_expression)
				end
				if select_expression.is_error then set_last_error (select_expression.error_value) end
			end
		end

	check_static_type (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform static type-checking of `Current' and its subexpressions.
		do
				if select_expression /= Void then
				select_expression.check_static_type (a_context, a_context_item_type)
				if select_expression.was_expression_replaced then
					set_selector (select_expression.replacement_expression)
				end
				if select_expression.is_error then set_last_error (select_expression.error_value) end
			end
			if not is_error then check_against_required_type (a_context) end
		end

	optimize (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform optimization of `Current' and its subexpressions.
		do
			if select_expression /= Void then
				select_expression.optimize (a_context, a_context_item_type)
				if select_expression.was_expression_replaced then
					set_selector (select_expression.replacement_expression)
				end
				if select_expression.is_error then set_last_error (select_expression.error_value) end
			end
		end

	promote_instruction (an_offer: XM_XPATH_PROMOTION_OFFER) is
			-- Promote this instruction.
		do
			if select_expression /= Void then
				select_expression.promote (an_offer)
				if select_expression.was_expression_replaced then
					set_selector (select_expression.replacement_expression)
				end
			end
			if select_expression.is_error then set_last_error (select_expression.error_value) end
		end

feature -- Evaluation

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item.
		do
			process (a_context)
			last_evaluated_item := Void
		end

	create_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Iterator over the values of a sequence
		do
			evaluate_item (a_context)
			create {XM_XPATH_EMPTY_ITERATOR [XM_XPATH_NODE]} last_iterator.make
		end
	
	select_value (a_context: XM_XSLT_EVALUATION_CONTEXT): XM_XPATH_VALUE is
			-- Value of `select_expression'
		require
			context_not_void: a_context /= Void
			select_expression_not_void: select_expression /= Void
		do
			select_expression.lazily_evaluate (a_context, Many_references)
			Result := select_expression.last_evaluation
		ensure
			variable_value_not_void: Result /= Void
		end

feature -- Element change

	initialize_variable (a_select_expression: XM_XPATH_EXPRESSION; a_required_type: XM_XPATH_SEQUENCE_TYPE; a_fingerprint: INTEGER) is
			-- Set initial values.
		do
			set_selector (a_select_expression)
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

feature -- Conversion

	is_global_variable: BOOLEAN is
			-- Is `Current' a global xsl:variable/param?
		do
			Result := False
		end

	as_global_variable: XM_XSLT_GLOBAL_VARIABLE is
			-- `Current' seen as a global xsl:variable/param
		require
			global_variable: is_global_variable
		do
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do

			-- an xsl:variable instruction generates no items

			set_cardinality_empty
		end

feature {NONE} -- Implementation
	
	check_against_required_type (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Check conformity against `required_type'.
		require
			static_context_not_void: a_context /= Void
			not_in_error: not is_error
		local
			a_role: XM_XPATH_ROLE_LOCATOR
			a_type_checker: XM_XPATH_TYPE_CHECKER
		do

			-- N.B. Sometimes this check gets performed more than once

			if required_type /= Void and then select_expression /= Void then
				create a_role.make (Variable_role, variable_name, 1, Xpath_errors_uri, "XTTE0570")
				create a_type_checker
				a_type_checker.static_type_check (a_context, select_expression, required_type, False, a_role)
				if a_type_checker.is_static_type_check_error	then
					set_last_error (a_type_checker.static_type_check_error)
				else
					set_selector (a_type_checker.checked_expression)
				end
			end
		end

end

