note

	description:

		"Objects that perform static type checking of expressions"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004-2014, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_TYPE_CHECKER

inherit

	XM_XPATH_TYPE

	XM_XPATH_ERROR_TYPES

	XM_XPATH_CARDINALITY

	XM_XPATH_SHARED_EXPRESSION_FACTORY

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

	XM_XPATH_SHARED_CONFORMANCE
		export {NONE} all end

	XM_XPATH_SHARED_NAME_POOL
		export {NONE} all end

	XM_XPATH_NAME_UTILITIES
		export {NONE} all end

	XM_XPATH_SHARED_ANY_ITEM_TYPE
		export {NONE} all end

	XM_XPATH_SHARED_ANY_NODE_TEST
		export {NONE} all end

		-- This class provides a single feature to perform static type-checking of an expression.
		-- The routine takes a `supplied' expression,  and checks to see whether it is
		--  known statically to conform to the `required' type.
		-- There are three possible outcomes.
		--  If the static type of the expression is a sub-type of the required
		--   type, the rotuine returns the expression unchanged.
		--  If the static type of the expression is incompatible with the required type
		--   (for example, if the supplied type is integer and the required type is string)
		--   the routine returns `Void' and sets `static_type_check_error'.
		--  If the static type is a super-type of the required type, then a new expression
		--   is constructed that evaluates the original expression and checks the dynamic
		--   type of the result; this new expression is returned as the result of the routine.

		-- The rules applied are those for function calling in XPath, that is, the rules
		--  that the argument of a function call must obey in relation to the signature of
		--  the function.
		-- Some contexts require slightly different rules (for example, operands of polymorphic
		--  operators such as "+"). In such cases this routine cannot be used.

feature -- Access

	checked_expression: detachable XM_XPATH_EXPRESSION
			-- Type-checked expression set by `static_type_check'

feature -- Status_report

	is_static_type_check_error: BOOLEAN
			-- Has a static typing error occurred?

	static_type_check_error: detachable XM_XPATH_ERROR_VALUE
			-- Error value from `static_type_check'

feature -- Optimization

	static_type_check (a_context: XM_XPATH_STATIC_CONTEXT; a_supplied_expression: XM_XPATH_EXPRESSION; a_required_type: XM_XPATH_SEQUENCE_TYPE; backwards_compatible: BOOLEAN; a_role_locator: XM_XPATH_ROLE_LOCATOR)
			-- Check an expression against a required type, modifying it if necessary
		require
			supplied_expression_not_in_error: a_supplied_expression /= Void and then not a_supplied_expression.is_error
			required_type_not_void: a_required_type /= Void
			role_not_void: a_role_locator /= Void
			no_previous_error: not is_static_type_check_error
		local
			a_message: STRING
			a_relationship: INTEGER
			a_required_cardinality: INTEGER
			an_expression: XM_XPATH_EXPRESSION
			a_computed_expression: XM_XPATH_COMPUTED_EXPRESSION
			an_item_checker: XM_XPATH_ITEM_CHECKER
		do
			static_context := a_context
			if a_context /= Void then
				function_library := a_context.available_functions
			end
			a_required_cardinality := a_required_type.cardinality
			initialize (a_supplied_expression, a_required_type)
			handle_xpath_one_compatibility (backwards_compatible)
			if not item_type_ok then
				handle_xpath_two_rules (a_context, a_role_locator)
			end

			-- If both the cardinality and item type are statically OK, return now.

			if item_type_ok and cardinality_ok then
				-- do_nothing - `checked_expression' has been set by `initialize'.
			else

				-- If we haven't evaluated the cardinality of the supplied expression, do it now

				if supplied_cardinality = -1 then
					check attached checked_expression as l_checked_expression then
						supplied_cardinality := l_checked_expression.cardinality
					end
				end
				if not cardinality_ok then
					cardinality_ok := a_required_type.cardinality_subsumes (supplied_cardinality)
				end

				-- If an empty sequence was explicitly supplied, and empty sequence is allowed,
				--  then the item type doesn't matter

				if cardinality_ok and then supplied_cardinality = Required_cardinality_empty then
					-- do_nothing - `checked_expression' has been set by `initialize'.
				else

					-- If we haven't evaluated the item type of the supplied expression, do it now

					if supplied_item_type = Void then
						check attached checked_expression as l_checked_expression then
							supplied_item_type := l_checked_expression.item_type
						end
					end

					-- If the supplied value is () and () isn't allowed, fail now

					if supplied_cardinality = Required_cardinality_empty and then not is_cardinality_allows_zero (a_required_cardinality) then
						report_error ("An empty sequence is not allowed as the ", a_role_locator)
					else

						-- Try a static type check. We only throw it out if the call cannot possibly succeed.

						if conformance.customized_host_language and then attached static_context as l_static_context and then attached supplied_item_type as l_supplied_item_type and then l_static_context.is_data_type_valid (l_supplied_item_type.as_atomic_type.fingerprint) then
							report_type_check_error (a_role_locator)
						else
							check attached supplied_item_type as l_supplied_item_type and attached required_item_type as l_required_item_type then
								a_relationship := type_relationship (l_supplied_item_type, l_required_item_type)
								if a_relationship = Disjoint_types then

									-- The item types may be disjoint, but if both the supplied and required types permit
									--  an empty sequence, we can't raise a static error. Raise a warning instead.

									if is_cardinality_allows_zero (supplied_cardinality) and then is_cardinality_allows_zero (a_required_cardinality) then
										if supplied_cardinality /= Required_cardinality_empty then
											a_message := STRING_.concat ("Required item type of ", a_role_locator.message)
											a_message := STRING_.appended_string (a_message, " is ")
											if attached required_item_type as l_required_item_type2 then
												a_message := STRING_.appended_string (a_message, l_required_item_type2.conventional_name)
											end
											a_message := STRING_.appended_string (a_message, "; supplied value has item type ")
											if attached supplied_item_type as l_supplied_item_type2 then
												a_message := STRING_.appended_string (a_message, l_supplied_item_type2.conventional_name)
											end
											a_message := STRING_.appended_string (a_message, ". The expression can succeed only if the supplied value is an empty sequence.")
											check attached static_context as l_static_context then
												l_static_context.issue_warning (a_message)
											end
										end
									else
										report_type_check_error (a_role_locator)
									end
								end
							end
						end

						if not is_static_type_check_error then

							-- Unless the type is guaranteed to match, add a dynamic type check,
							--  unless the value is already known in which case we might
							--  as well report the error now.

							if a_relationship /= Same_item_type and then a_relationship /= Subsumed_type then
								check attached checked_expression as l_checked_expression and attached required_item_type as l_required_item_type then
									an_expression := l_checked_expression
									create an_item_checker.make (an_expression, l_required_item_type, a_role_locator)
									an_item_checker.adopt_child_expression (an_expression)
									checked_expression := an_item_checker
								end
							end
							if not cardinality_ok then
								check attached checked_expression as l_checked_expression then
									if l_checked_expression.is_value then
										report_type_check_error (a_role_locator)
									else
										an_expression := l_checked_expression
										a_computed_expression := expression_factory.created_cardinality_checker (an_expression, a_required_type.cardinality, a_role_locator)
										a_computed_expression.adopt_child_expression (an_expression)
										checked_expression := a_computed_expression
									end
								end
							end
						end
					end
				end
			end
		ensure
			no_static_error_implies_non_void_result: not is_static_type_check_error implies checked_expression /= Void
			static_error_implies_void_result: is_static_type_check_error implies checked_expression = Void
		end

feature {NONE} -- Implementation

	required_item_type: detachable XM_XPATH_ITEM_TYPE
			-- Required item type

	required_type: detachable XM_XPATH_SEQUENCE_TYPE
			-- Required sequence type

	supplied_cardinality: INTEGER
			-- Cardinality of supplied expression

	supplied_item_type: detachable XM_XPATH_ITEM_TYPE
			-- Item type of supplied expression.

	allows_many: BOOLEAN
			-- Is more than one item allowed?

	cardinality_ok: BOOLEAN
			-- Is the cardinality proven to be OK?

	item_type_ok: BOOLEAN
			-- Is the item type been proven to be OK?

	initialize (a_supplied_expression: XM_XPATH_EXPRESSION; a_required_type: XM_XPATH_SEQUENCE_TYPE)
			-- Initial attributes
		do
			is_static_type_check_error := False
			required_type := a_required_type
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
			-- check the static item type against the supplied expression.
			-- Note: we don't currently do any static inference regarding the content type

			if not item_type_ok then
				supplied_item_type := a_supplied_expression.item_type
				check attached required_item_type as l_required_item_type then
					item_type_ok := is_sub_type (supplied_item_type, l_required_item_type)
				end
			end
		ensure
			supplied_item_type: not item_type_ok implies supplied_item_type /= Void
		end

	report_error (a_message: STRING; a_role_locator: XM_XPATH_ROLE_LOCATOR)
			-- Report custom error message.
		require
			messaage_not_void: a_message /= Void
			role_locator_not_void: a_role_locator /= Void
		do
			is_static_type_check_error := True
			create static_type_check_error.make_from_string (STRING_.concat (a_message, a_role_locator.message), a_role_locator.namespace_uri, a_role_locator.error_code, Type_error)

			-- TODO need to add location information.

			checked_expression := Void
		end

	handle_xpath_one_compatibility (backwards_compatible: BOOLEAN)
			-- Handle the special rules for 1.0 compatibility mode
		local
			an_expression: XM_XPATH_EXPRESSION
			a_computed_expression: XM_XPATH_COMPUTED_EXPRESSION
		do
			if backwards_compatible and not allows_many then
				if is_cardinality_allows_many (supplied_cardinality) then -- Rule 1
					check attached checked_expression as l_checked_expression then
						an_expression := l_checked_expression
						create {XM_XPATH_FIRST_ITEM_EXPRESSION} a_computed_expression.make (an_expression)
						a_computed_expression.adopt_child_expression (an_expression)
						checked_expression := a_computed_expression
						supplied_cardinality := Required_cardinality_optional
						check attached required_type as l_required_type then
							cardinality_ok := l_required_type.cardinality_subsumes (supplied_cardinality)
						end
					end
				end
				if not item_type_ok then
					if required_item_type = type_factory.string_type then -- Rule 2
						wrap_in_string_function
					elseif required_item_type = type_factory.numeric_type
						or else required_item_type = type_factory.double_type then  -- Rule 3
						wrap_in_number_function
					end
				end
			end
		end

	report_type_check_error (a_role_locator: XM_XPATH_ROLE_LOCATOR)
			-- Report failure of static type checking
		require
			role_locator_not_void: a_role_locator /= Void
		local
			a_message: STRING
		do
			is_static_type_check_error := True
			a_message := STRING_.concat ("Required type of ", a_role_locator.message)
			a_message := STRING_.appended_string (a_message, " is ")
			if attached required_item_type as l_required_item_type then
				a_message := STRING_.appended_string (a_message, l_required_item_type.conventional_name)
			end
			a_message := STRING_.appended_string (a_message, "; supplied value has type ")
			if attached supplied_item_type as l_supplied_item_type then
				a_message := STRING_.appended_string (a_message, l_supplied_item_type.conventional_name)
			end

			-- TODO add location info

			create static_type_check_error.make_from_string (a_message, a_role_locator.namespace_uri, a_role_locator.error_code, Type_error)
			checked_expression := Void
		end

	wrap_in_string_function
			-- Wrap an fn:string() function around `checked_expression'.
		local
			l_string_function: XM_XPATH_STRING
			l_new_arguments: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]
			l_expression: XM_XPATH_EXPRESSION
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			if attached function_library as l_function_library and attached checked_expression as l_checked_expression then
				create l_new_arguments.make (1)
				l_new_arguments.put_last (l_checked_expression)
				l_function_library.bind_function (String_function_type_code, l_new_arguments, False)
				check postcondition_of_bind_function: attached l_function_library.last_bound_function as l_last_bound_function then
					l_string_function := l_last_bound_function.as_string_function
					create l_replacement.make (Void)
					l_string_function.simplify (l_replacement)
					check postcondition_of_simplify: attached l_replacement.item as l_replacement_item then
						l_expression := l_replacement_item
						l_replacement.put (Void)
						check attached static_context as l_static_context then
							l_expression.check_static_type (l_replacement, l_static_context, any_item)
							check postcondition_of_check_static_type: attached l_replacement.item as l_replacement_item2 then
								checked_expression := l_replacement_item2
								supplied_item_type := type_factory.string_type
								supplied_cardinality := Required_cardinality_exactly_one
								check attached required_type as l_required_type then
									cardinality_ok := l_required_type.cardinality_subsumes (supplied_cardinality)
								end
								item_type_ok := True
							end
						end
					end
				end
			else
				check
					False
					-- We must have a static context to detect XPath 1.0 compatibility, and therefore
					--  `function_library' cannot be Void
				end
			end
		end

	wrap_in_number_function
			-- Wrap an fn:number() function around `checked_expression'.
		local
			l_number_function: XM_XPATH_NUMBER
			l_new_arguments: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]
			l_expression: XM_XPATH_EXPRESSION
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			if attached function_library as l_function_library and then attached checked_expression as l_checked_expression then
				create l_new_arguments.make (1)
				l_new_arguments.put_last (l_checked_expression)
				l_function_library.bind_function (Number_function_type_code, l_new_arguments, False)
				check postcondition_of_bind_function: attached l_function_library.last_bound_function as l_last_bound_function then
					l_number_function := l_last_bound_function.as_number_function
					create l_replacement.make (Void)
					l_number_function.simplify (l_replacement)
					check postcondition_of_simplify: attached l_replacement.item as l_replacement_item then
						l_expression := l_replacement_item
						l_replacement.put (Void)
						check attached static_context as l_static_context then
							l_expression.check_static_type (l_replacement, l_static_context, any_item)
							check postcondition_of_check_static_type: attached l_replacement.item as l_replacement_item2 then
								checked_expression := l_replacement_item2
								supplied_item_type := type_factory.double_type
								supplied_cardinality := Required_cardinality_exactly_one
								check attached required_type as l_required_type then
									cardinality_ok := l_required_type.cardinality_subsumes (supplied_cardinality)
								end
								item_type_ok := True
							end
						end
					end
				end
			else
				check
					False
					-- We must have a static context to detect XPath 1.0 compatibility, and therefore
					--  `function_library' cannot be Void
				end
			end
		end

	handle_xpath_two_rules (a_context: XM_XPATH_STATIC_CONTEXT; a_role_locator: XM_XPATH_ROLE_LOCATOR)
			-- Apply conversions needed in 2.0 mode.
		require
			a_context_not_void: a_context /= Void
			role_not_void: a_role_locator /= Void
		local
			l_required_item_type_fingerprint: INTEGER
			l_expression: XM_XPATH_EXPRESSION
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
			l_checked_expression: like checked_expression
		do
			if attached required_item_type as l_required_item_type and then l_required_item_type.is_atomic_type then

				-- Rule 1: Atomize

				conditionally_atomize

				-- Rule 2: convert untypedAtomic to the required type

				conditionally_add_untyped_converter (a_context, a_role_locator)

				-- Rule 3: numeric promotion decimal -> float -> double

				l_required_item_type_fingerprint := l_required_item_type.as_atomic_type.fingerprint
				if l_required_item_type_fingerprint = Float_type_code or else l_required_item_type_fingerprint = Double_type_code then
					l_checked_expression := checked_expression
					if attached supplied_item_type as l_supplied_item_type and then type_relationship (l_supplied_item_type, type_factory.numeric_type) /= Disjoint_types and l_checked_expression /= Void then
						l_expression := l_checked_expression
						create {XM_XPATH_NUMERIC_PROMOTER} l_expression.make (l_expression, l_required_item_type_fingerprint)
						create l_replacement.make (Void)
						l_expression.simplify (l_replacement)
						check postcondition_of_simply: attached l_replacement.item as l_replacement_item then
							l_expression := l_replacement_item
							l_replacement.put (Void)
							check attached static_context as l_static_context then
								l_expression.check_static_type (l_replacement, l_static_context, any_item)
								check postcondition_of_check_static_type: attached l_replacement.item as l_replacement_item2 then
									checked_expression := l_replacement_item2
									if l_required_item_type_fingerprint = Double_type_code then
										supplied_item_type := type_factory.double_type
									else
										supplied_item_type := type_factory.float_type
									end
								end
							end
						end
					end
				end

				-- Rule 4: anyURI promotion anyURI -> string

				if l_required_item_type_fingerprint = String_type_code and then is_sub_type (supplied_item_type, type_factory.any_uri_type) then
					supplied_item_type := type_factory.string_type
					item_type_ok := True

				 -- We don't generate code to do a run-time type conversion; rather, we rely on
				 --  operators and functions that accept a string to also accept an xs:anyURI.
             -- This relies on XM_XPATH_ANY_URI_VALUE being a descendant of XM_XPATH_STRING_VALUE

				end
			end
		end

	conditionally_atomize
			-- Conditionally add an Atomizer
		local
			l_expression: XM_XPATH_EXPRESSION
			a_computed_expression: XM_XPATH_COMPUTED_EXPRESSION
			l_supplied_item_type: like supplied_item_type
			l_checked_expression: like checked_expression
			l_static_context: like static_context
		do
			l_supplied_item_type := supplied_item_type
			l_checked_expression := checked_expression
			l_static_context := static_context
			if l_supplied_item_type /= Void and then not l_supplied_item_type.is_atomic_type and l_checked_expression /= Void and l_static_context /= Void then
				if supplied_cardinality /= Required_cardinality_empty then
					l_expression := l_checked_expression
					create {XM_XPATH_ATOMIZER_EXPRESSION} a_computed_expression.make (l_expression, l_static_context.configuration.are_all_nodes_untyped)
					a_computed_expression.adopt_child_expression (l_expression)
					l_checked_expression := a_computed_expression
					checked_expression := l_checked_expression
					supplied_item_type := l_checked_expression.item_type
					supplied_cardinality := l_checked_expression.cardinality
					cardinality_ok := attached required_type as l_required_type and then l_required_type.cardinality_subsumes (supplied_cardinality)
				end
			end
		end

	conditionally_add_untyped_converter (a_context: XM_XPATH_STATIC_CONTEXT; a_role_locator: XM_XPATH_ROLE_LOCATOR)
			--  Conditionally add an Untyped Atomic Converter
		require
			a_context_not_void: a_context /= Void
			role_not_void: a_role_locator /= Void
		local
			l_expression: XM_XPATH_EXPRESSION
			l_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			l_converter: XM_XPATH_UNTYPED_ATOMIC_CONVERTER
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
			l_checked_expression: like checked_expression
			l_required_item_type: like required_item_type
		do

			-- Rule 2a: all supplied values are untyped atomic. Convert if necessary, and we're finished.
			-- Rule 2b: some supplied values are untyped atomic. Convert these to the required type; but
			--   there may be other values in the sequence that won't convert and still need to be checked
			l_checked_expression := checked_expression
			l_required_item_type := required_item_type
			if
				(supplied_item_type = type_factory.untyped_atomic_type or else supplied_item_type = type_factory.any_atomic_type) and then
				l_required_item_type /= Void and then
				l_required_item_type /= type_factory.untyped_atomic_type and then
				l_required_item_type /= type_factory.any_atomic_type and then l_checked_expression /= Void and then not l_checked_expression.is_untyped_atomic_converter
			then
				l_expression := l_checked_expression
				create l_converter.make (l_expression, l_required_item_type)
				if STRING_.same_string (a_role_locator.error_code, "XTTE0505") then
					l_converter.set_error_code (a_role_locator.error_code)
				end
				l_checked_expression := l_converter
				checked_expression := l_checked_expression
				if l_expression.is_value and then not l_expression.depends_upon_implicit_timezone then
					l_checked_expression.create_iterator (a_context.new_compile_time_context)
					check postcondition_of_create_iterator: attached l_checked_expression.last_iterator as l_checked_expression_last_iterator then
						l_iterator := l_checked_expression_last_iterator
						if attached l_iterator.error_value as l_error_value then
							check is_error: l_iterator.is_error end
							l_checked_expression.set_last_error (l_error_value)
						else
							create {XM_XPATH_SEQUENCE_EXTENT} l_checked_expression.make (l_iterator)
							checked_expression := l_checked_expression
							create l_replacement.make (Void)
							l_checked_expression.simplify (l_replacement)
							check postcondition_of_simplify: attached l_replacement.item as l_replacement_item then
								checked_expression := l_replacement_item
							end
						end
					end
				end
				if supplied_item_type = type_factory.untyped_atomic_type then
					supplied_item_type := required_item_type
					item_type_ok := True
				end
			end
		end

	function_library: detachable XM_XPATH_FUNCTION_LIBRARY
			-- Function library

	static_context: detachable XM_XPATH_STATIC_CONTEXT
			-- Static context

invariant

	error_message_when_error: is_static_type_check_error implies static_type_check_error /= Void

end

