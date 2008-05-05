indexing

	description:

		"Objects that represent the compiled form of XSLT variables and parameters"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
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
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
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
			-- Is `Current' a required parameter?

	is_implicitly_required_parameter: BOOLEAN
			-- Is `Current' treates as a required parameter?

	is_tunnel_parameter: BOOLEAN
			-- Is `Current' a tunnel paramter?

	is_global: BOOLEAN is
			-- Is binding global or local?
		do
			Result := False
		end

feature -- Status setting

	set_selector (a_select_expression: XM_XPATH_EXPRESSION) is
			-- Ensure `select_expression' = `a_select_expression'.
		do
			if select_expression /= a_select_expression then
				select_expression := a_select_expression
				if select_expression /= Void then
					adopt_child_expression (select_expression)
					reset_static_properties
				end
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

	set_implicitly_required_parameter (is_required: BOOLEAN) is
			-- Set implicitly required parameter.
		do
			is_implicitly_required_parameter := is_required
		ensure
			set: is_implicitly_required_parameter = is_required
		end

	set_tunnel_parameter (is_tunnel: BOOLEAN) is
			-- Set tunnel/optional parameter.
		do
			is_tunnel_parameter := is_tunnel
		ensure
			set: is_tunnel_parameter = is_tunnel
		end

feature -- Optimization

	simplify (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]) is
			-- Perform context-independent static optimizations
		local
			l_replacement: DS_CELL [XM_XPATH_EXPRESSION]
		do
			if select_expression /= Void then
				if not select_expression.is_error then
					create l_replacement.make (Void)
					select_expression.simplify (l_replacement)
					set_selector (l_replacement.item)
				end
				if select_expression.is_error then
					set_replacement (a_replacement, select_expression)
				end
			end
			if a_replacement.item = Void then
				a_replacement.put (Current)
			end
		end

	check_static_type (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform static type-checking of `Current' and its subexpressions.
		local
			l_replacement: DS_CELL [XM_XPATH_EXPRESSION]
		do
			if select_expression /= Void then
				create l_replacement.make (Void)
				select_expression.check_static_type (l_replacement, a_context, a_context_item_type)
				set_selector (l_replacement.item)
				if select_expression.is_error then
					set_replacement (a_replacement, select_expression)
				end
			end
			if not is_error and a_replacement.item = Void then
				check_against_required_type (a_replacement, a_context)
			end
		end

	optimize (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform optimization of `Current' and its subexpressions.
		local
			l_replacement: DS_CELL [XM_XPATH_EXPRESSION]
		do
			if select_expression /= Void then
				create l_replacement.make (Void)
				select_expression.optimize (l_replacement, a_context, a_context_item_type)
				set_selector (l_replacement.item)
				if select_expression.is_error then
					set_replacement (a_replacement, select_expression)
				end
			end
			if a_replacement.item = Void then
				a_replacement.put (Current)
			end
		end

	promote_instruction (a_offer: XM_XPATH_PROMOTION_OFFER) is
			-- Promote this instruction.
		local
			l_replacement: DS_CELL [XM_XPATH_EXPRESSION]
		do
			if select_expression /= Void then
				create l_replacement.make (Void)
				select_expression.promote (l_replacement, a_offer)
				set_selector (l_replacement.item)
			end
		end

feature -- Evaluation

	evaluate_item (a_result: DS_CELL [XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item to `a_result'.
		do
			generate_events (a_context)
			a_result.put (Void)
		end

	create_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Iterator over the values of a sequence
		local
			l_item: DS_CELL [XM_XPATH_ITEM]
		do
			create l_item.make (Void)
			evaluate_item (l_item, a_context)
			create {XM_XPATH_EMPTY_ITERATOR [XM_XPATH_NODE]} last_iterator.make
		end
	
	select_value (a_context: XM_XSLT_EVALUATION_CONTEXT): XM_XPATH_VALUE is
			-- Value of `select_expression'
		require
			context_not_void: a_context /= Void
			select_expression_not_void: select_expression /= Void
		local
			l_result: DS_CELL [XM_XPATH_VALUE]
		do
			create l_result.make (Void)
			select_expression.evaluate (l_result, select_expression.lazy_evaluation_mode, Many_references, a_context)
			Result := l_result.item
			if Result = Void then
				create {XM_XPATH_EMPTY_SEQUENCE} Result.make
			end
		ensure
			select_value_not_void: Result /= Void
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
	
	check_against_required_type (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Check conformity against `required_type'.
		require
			static_context_not_void: a_context /= Void
			not_in_error: not is_error
			a_replacement_not_void: a_replacement /= Void
			not_replaced: a_replacement.item = Void			
		local
			l_role: XM_XPATH_ROLE_LOCATOR
			l_type_checker: XM_XPATH_TYPE_CHECKER
		do

			-- N.B. Sometimes this check gets performed more than once

			if required_type /= Void and then select_expression /= Void then
				create l_role.make (Variable_role, variable_name, 1, Xpath_errors_uri, "XTTE0570")
				create l_type_checker
				l_type_checker.static_type_check (a_context, select_expression, required_type, False, l_role)
				if l_type_checker.is_static_type_check_error	then
					set_replacement (a_replacement, create {XM_XPATH_INVALID_VALUE}.make (l_type_checker.static_type_check_error))
				else
					set_selector (l_type_checker.checked_expression)
				end
			end
			if a_replacement.item = Void then
				a_replacement.put (Current)
			end
		ensure
			replaced: a_replacement.item /= Void
		end

end

