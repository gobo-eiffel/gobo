indexing

	description:

		"Objects that perform static type checking of expressions"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_TYPE_CHECKER

inherit

	XM_XPATH_TYPE

	XM_XPATH_CARDINALITY

	XM_XPATH_SHARED_FUNCTION_FACTORY

	KL_IMPORTED_STRING_ROUTINES

	XM_XPATH_SHARED_CONFORMANCE

	XM_XPATH_SHARED_ANY_ITEM_TYPE

	XM_XPATH_SHARED_ANY_NODE_TEST

	-- This class provides a single feature to perform static type-checking of an expression.
	-- The routine takes a `supplied' expression,  and checks to see whether it is
	--  known statically to conform to the `required' type.
	-- There are three possible outcomes.
	--  If the static type of the expression is a sub-type of the required
	--   type, the rotuine returns the expression unchanged.
	--  If the static type of the expression is incompatible with the required type
	--   (for example, if the supplied type is integer and the required type is string)
	--   the routine returns `Void' and sets `static_type_check_error_message'.
	--  If the static type is a super-type of the required type, then a new expression
	--   is constructed that evaluates the original expression and checks the dynamic
	--   type of the result; this new expression is returned as the result of the routine.

	-- The rules applied are those for function calling in XPath, that is, the rules
	--  that the argument of a function call must obey in relation to the signature of
	--  the function.
	-- Some contexts require slightly different rules (for example, operands of polymorphic
	--  operators such as "+"). In such cases this routine cannot be used.

feature -- Access

	checked_expression: XM_XPATH_EXPRESSION
		-- Type-checked expression set by `static_type_check'	

feature -- Status_report

	is_static_type_check_error: BOOLEAN
			-- Has a static typing error occured?

	static_type_check_error_message: STRING
			-- Error message from `static_type_check'

feature -- Optimization

	static_type_check (a_context: XM_XPATH_STATIC_CONTEXT; a_supplied_expression: XM_XPATH_EXPRESSION; a_required_type: XM_XPATH_SEQUENCE_TYPE; backwards_compatible: BOOLEAN; a_role_locator: XM_XPATH_ROLE_LOCATOR) is
			-- Check an expression against a required type, modifying it if necessary
		require
			supplied_expression_not_void: a_supplied_expression /= Void
			required_type_not_void: a_required_type /= Void
			role_not_void: a_role_locator /= Void
			no_previous_error: not is_static_type_check_error
		local
			a_message: STRING
			a_value: XM_XPATH_VALUE
		do
			initialize (a_supplied_expression, a_required_type)

			-- If both the cardinality and item type are statically OK, return now.
			
			if item_type_ok and cardinality_ok then
				do_nothing -- `checked_expression' has been set by `initialize'.
			else
				set_cardinality_and_item_type
				if supplied_cardinality = Required_cardinality_empty and then not a_required_type.cardinality_allows_zero then
					report_error (STRING_.appended_string ("An empty sequence is not allowed as the ", a_role_locator.message))
				else
					handle_xpath_one_compatibility (backwards_compatible)
					conditionally_atomize
					conditionally_add_untyped_converter

					-- Try a static type check. We only throw it out if the call cannot possibly succeed.

					if conformance.customized_host_language and then not a_context.is_data_type_valid (supplied_item_type.fingerprint) then
						report_type_check_error (a_role_locator)
					elseif not is_sub_type (supplied_item_type, required_item_type) then
						-- with pessimistic type checking we could output an error now, but we
						-- give the user another chance to get it right at run-time
						
						a_value ?= checked_expression; if a_value /= void or else not is_sub_type (required_item_type, supplied_item_type)  then
							report_type_check_error (a_role_locator)
						end
					end
					
					if not is_static_type_check_error then
						
						-- Unless the type is guaranteed to match, add a dynamic type check
						
						if not item_type_ok then
							create {XM_XPATH_ITEM_CHECKER} checked_expression.make (checked_expression, required_item_type, a_role_locator)
							-- TODO need to copy location information
						end
						if not cardinality_ok then
							create {XM_XPATH_CARDINALITY_CHECKER} checked_expression.make (checked_expression, a_required_type.cardinality, a_role_locator)
							-- TODO need to copy location information
						end
					end				
				end
			end
		ensure
			no_static_error_implies_non_void_result: not is_static_type_check_error implies checked_expression /= Void
			static_error_implies_void_result: is_static_type_check_error implies checked_expression = Void
		end	

feature {NONE} -- Implementation

	required_item_type: XM_XPATH_ITEM_TYPE
			-- Required item type
	
	supplied_cardinality: INTEGER
			-- Cardinality of supplied expression
		
	supplied_item_type: XM_XPATH_ITEM_TYPE
			-- Item type of supplied expression.

	allows_many: BOOLEAN
			-- Is more than one item allowed?

	cardinality_ok: BOOLEAN
		-- Is the cardinality proven to be OK?
		
	item_type_ok: BOOLEAN
		-- Is the item type been proven to be OK?

	initialize (a_supplied_expression: XM_XPATH_EXPRESSION; a_required_type: XM_XPATH_SEQUENCE_TYPE) is
			-- Initial attributes
		do
			is_static_type_check_error := False
			required_item_type := a_required_type.primary_type
			allows_many := a_required_type.cardinality_allows_many
			supplied_item_type := Void -- not yet checked
			supplied_cardinality := -1 -- not yet checked
			item_type_ok := required_item_type = any_item
			cardinality_ok := a_required_type.cardinality_allows_zero_or_more

			-- Unless the required cardinality is zero-or-more (no constraints),
			--  check the static cardinality of the supplied expression

			if not cardinality_ok then
				supplied_cardinality := a_supplied_expression.cardinality
				cardinality_ok := a_required_type.cardinality_subsumes (supplied_cardinality)
			end

			checked_expression := a_supplied_expression

			-- Unless the required item type and content type are Any_item (no constraints)
			--  check the static item type against the supplied expression.
			-- NOTE: we don't currently do any static inference regarding the content type

			if not item_type_ok then
				supplied_item_type := a_supplied_expression.item_type
				item_type_ok := is_sub_type (supplied_item_type, required_item_type)
				if not item_type_ok then
					if is_promotable (supplied_item_type, required_item_type) then
						item_type_ok := True
						create {XM_XPATH_CAST_EXPRESSION} checked_expression.make (a_supplied_expression, required_item_type, True)
						supplied_item_type := required_item_type
					end
				end
			end
		end

	set_cardinality_and_item_type is
			-- Evaluate the cardinality and item type of the supplied expression.
		do
			if supplied_cardinality = -1 then supplied_cardinality := checked_expression.cardinality	end
			if supplied_item_type = Void then supplied_item_type := checked_expression.item_type end
		end

	report_error (a_string :STRING) is
			-- Report `a_string' as an error message.
		do
			is_static_type_check_error := True
			static_type_check_error_message := a_string
			-- TODO need to add location information
			checked_expression := Void
		end

	handle_xpath_one_compatibility (backwards_compatible: BOOLEAN) is
			-- Handle the special rules for 1.0 compatibility mode
		local
			a_number_function: XM_XPATH_NUMBER
			new_arguments: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]
		do
			if backwards_compatible and not allows_many then
				if is_sub_type (required_item_type, type_factory.string_type) then
					if is_sub_type (supplied_item_type, type_factory.any_atomic_type) then
						create {XM_XPATH_ATOMIZER_EXPRESSION} checked_expression.make (checked_expression)
						-- TODO need to copy location information
					end
					create {XM_XPATH_STRING_CONVERTER_EXPRESSION} checked_expression.make (checked_expression)
					-- TODO need to copy location information
					supplied_item_type := type_factory.string_type
					supplied_cardinality := Required_cardinality_exactly_one
				elseif required_item_type =type_factory.numeric_type or else is_sub_type (required_item_type, type_factory.double_type) then
					
					-- TODO: in the Nov 2003 draft, the rules have changed so that number() is called
					-- only if the supplied value doesn't match the expected type. We're currently
					-- returning different results for round(()) depending on whether the arg value
					-- is known statically or not.
					
					a_number_function ?= function_factory.make_system_function ("number")
						check
							number_function: a_number_function /= Void
						end
					create new_arguments.make (1)
					new_arguments.put_last (checked_expression)
					a_number_function.set_arguments (new_arguments)
					checked_expression := a_number_function
					-- TODO copy location info
					supplied_item_type := type_factory.double_type
					supplied_cardinality := Required_cardinality_exactly_one
				elseif required_item_type = any_node_test or else required_item_type = any_item or else required_item_type = type_factory.any_atomic_type then
					-- TODO:this last condition isn't in the rules for function calls,
					-- but is needed for arithmetic expressions
					if is_cardinality_allows_many (supplied_cardinality) then
						create {XM_XPATH_FIRST_ITEM_EXPRESSION} checked_expression.make (checked_expression)
						-- TODO copy location info
					end
					supplied_cardinality := Required_cardinality_optional
				end						
			end
		end

	conditionally_atomize is
			-- Conditionally add an Atomizer
		do
			if is_sub_type (required_item_type, type_factory.any_atomic_type) and then not is_sub_type (supplied_item_type, type_factory.any_atomic_type) then
				create {XM_XPATH_ATOMIZER_EXPRESSION} checked_expression.make (checked_expression)
				-- TODO need to copy location information
				supplied_item_type := checked_expression.item_type
				supplied_cardinality := checked_expression.cardinality
			end
		end

	conditionally_add_untyped_converter is	
			--  Conditionally add an Untyped Atomic Converter
		do
			if required_item_type /= type_factory.any_atomic_type and then is_sub_type (required_item_type, type_factory.any_atomic_type)
					and then (supplied_item_type = type_factory.any_atomic_type or else is_sub_type (supplied_item_type, type_factory.untyped_atomic_type)) then
					create {XM_XPATH_UNTYPED_ATOMIC_CONVERTER} checked_expression.make (checked_expression, required_item_type)
					-- TODO need to copy location information
					supplied_item_type := checked_expression.item_type
					supplied_cardinality := checked_expression.cardinality
				end
			end

	report_type_check_error (a_role_locator: XM_XPATH_ROLE_LOCATOR) is
			-- Report failure od static type checking
		do
			is_static_type_check_error := True
			static_type_check_error_message := STRING_.appended_string ("Required type of ", a_role_locator.message)
			static_type_check_error_message := STRING_.appended_string (static_type_check_error_message, " is ")
			static_type_check_error_message := STRING_.appended_string (static_type_check_error_message, required_item_type.conventional_name)
			static_type_check_error_message := STRING_.appended_string (static_type_check_error_message, "; supplied value has type ")
			static_type_check_error_message := STRING_.appended_string (static_type_check_error_message, supplied_item_type.conventional_name)
			--			print (supplied_item_type)
			--			print (required_item_type)
			-- TODO add location info
			checked_expression := Void
		end

invariant

	error_message_when_error: is_static_type_check_error implies static_type_check_error_message /= Void

end

